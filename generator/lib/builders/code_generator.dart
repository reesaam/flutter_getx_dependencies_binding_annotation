/// Do not Import Get Library => package:get/get.dart';

import 'dart:async';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import '../components/descriptions_generator.dart';
import '../components/log.dart';
import '../models/extracted_info_model.dart';
import '../resources/constants.dart';
import '../resources/enums.dart';
import '../extensions/string.dart';
import '../resources/strings.dart';

class CodeGenerator extends Generator {

  static List<String> importsList = List<String>.empty(growable: true);
  static List<String> pagesList = List<String>.empty(growable: true);
  static List<String> controllersList = List<String>.empty(growable: true);
  static List<String> componentsList = List<String>.empty(growable: true);
  static List<String> repositoriesList = List<String>.empty(growable: true);

  @override
  FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) async {

    ///Variables
    String statisticsCodeBody = Strings.empty;
    String importsCodeBody = Strings.empty;
    String pagesCodeBody = Strings.empty;
    String controllersCodeBody = Strings.empty;
    String componentsCodeBody = Strings.empty;
    String repositoriesCodeBody = Strings.empty;
    String dependenciesCodeBody = Strings.empty;
    String bindingsCodeBody = Strings.empty;
    String mainCodeBody = Strings.empty;

    bool canGenerate = library.element.source.uri.path.contains(ImportDependencies.main.url);
    if(canGenerate) {
      log(title: 'Code Generation Started');

      /// Imports
      importsCodeBody = importsCodeBody.addImport(ImportDependencies.main.url);
      importsCodeBody = importsCodeBody.addImport(ImportDependencies.get.url);
      for(var import in importsList) {
        importsCodeBody = importsCodeBody.addImport(import.correctImport);
      }

      ///Statistics
      statisticsCodeBody = statisticsCodeBody.addCommentLine('Generated Library');
      statisticsCodeBody = statisticsCodeBody.addCommentLine('$elementsMainName Main Library');
      statisticsCodeBody = statisticsCodeBody.addCommentLine('$elementsMainName Statistics:');
      statisticsCodeBody = statisticsCodeBody.addCommentLine('  Imports Count: ${importsList.length}');
      statisticsCodeBody = statisticsCodeBody.addCommentLine('  Pages Count: ${pagesList.length}');
      statisticsCodeBody = statisticsCodeBody.addCommentLine('  Controllers Count: ${controllersList.length}');
      statisticsCodeBody = statisticsCodeBody.addCommentLine('  Components Count: ${componentsList.length}');
      statisticsCodeBody = statisticsCodeBody.addCommentLine('  Repositories Count: ${repositoriesList.length}');

      /// Bodies Generation
      String pages = Strings.empty;
      for (var page in pagesList) {
        pages = pages.addLine(page);
        log.info(title: 'Page Added to Pages', data: page);
      }

      // initialPageString = 'GetPage(name: \'/${page}\', page: ${page}.new)';
      // unknownPageString = 'GetPage(name: \'/${page}\', page: ${page}.new)';
      // pagesBody = pagesBody.addLine('static GetPage? initialPage = ${initialPageString.isEmpty ? null : initialPageString};');
      // pagesBody = pagesBody.addLine('static GetPage? unknownPage = ${unknownPageString.isEmpty ? null : unknownPageString};');
      pagesCodeBody = pagesCodeBody.addClass(className: '${AnnotationTypes.page.name.capitalizeFirst}s', body: 'static List<GetPage> get ${AnnotationTypes.page.name}s => [${pages}\n];');

      for(var controller in controllersList) {
        controllersCodeBody = controllersCodeBody.addLine(controller);
        log.info(title: 'Controller Added to Pages', data: controller);
      }
      for(var component in componentsList) {
        componentsCodeBody = componentsCodeBody.addLine(component);
        log.info(title: 'Component Added to Pages', data: component);
      }
      for(var repository in repositoriesList) {
        repositoriesCodeBody = repositoriesCodeBody.addLine(repository);
        log.info(title: 'Repository Added to Pages', data: repository);
      }

      dependenciesCodeBody = dependenciesCodeBody.addDependencyClass(className: AnnotationTypes.controller.name.capitalizeFirst, body: controllersCodeBody);
      dependenciesCodeBody = dependenciesCodeBody.addDependencyClass(className: AnnotationTypes.component.name.capitalizeFirst, body: componentsCodeBody);
      dependenciesCodeBody = dependenciesCodeBody.addDependencyClass(className: AnnotationTypes.repository.name.capitalizeFirst, body: repositoriesCodeBody);

      bindingsCodeBody = bindingsCodeBody.addLine('_$elementsMainName${AnnotationTypes.controller.name.capitalizeFirst}().$generatedFilesDependenciesPostfix();');
      bindingsCodeBody = bindingsCodeBody.addLine('_$elementsMainName${AnnotationTypes.component.name.capitalizeFirst}().$generatedFilesDependenciesPostfix();');
      bindingsCodeBody = bindingsCodeBody.addLine('_$elementsMainName${AnnotationTypes.repository.name.capitalizeFirst}().$generatedFilesDependenciesPostfix();');


      /// CodeBody Generation
      // mainCodeBody = mainCodeBody.addLine('part \'main.dart\';').addSpace();
      mainCodeBody = mainCodeBody.addCommentLine(DescriptionGenerator().generate()).addSpace();
      mainCodeBody = mainCodeBody.addLine(importsCodeBody).addSpace();
      mainCodeBody = mainCodeBody.addLine(statisticsCodeBody).addSpace();
      mainCodeBody = mainCodeBody.addLine(pagesCodeBody).addSpace();
      mainCodeBody = mainCodeBody.addBindingClass(body: bindingsCodeBody).addSpace();
      mainCodeBody = mainCodeBody.addLine(dependenciesCodeBody).addSpace();

      log(title: 'Code Generation Finished');
    }

    bool canPublish = mainCodeBody.isNotEmpty && canGenerate;
    return canPublish ? mainCodeBody : null;
  }

  addElement(ExtractedInfoModel element) {
    switch(element.type) {
      case AnnotationTypes.page: pagesList.add(_pageDependencyFormat(element)); break;
      case AnnotationTypes.controller: controllersList.add(_controllerDependencyFormat(element)); break;
      case AnnotationTypes.component: componentsList.add(_controllerDependencyFormat(element)); break;
      case AnnotationTypes.repository: repositoriesList.add(_controllerDependencyFormat(element)); break;
      default: break;
    }
    importsList.add(_findSourceImport(element));
  }

  String _findSourceImport(ExtractedInfoModel element) => element.element.source!.uri.path;
  String _pageDependencyFormat(ExtractedInfoModel element) => 'GetPage(name: \'/${element.name}\', page: ${element.name}.new),';
  String _controllerDependencyFormat(ExtractedInfoModel element) => 'Get.lazyPut<${element.as ?? element.name}>(() => ${element.name}(), fenix: ${fenix});';
}
