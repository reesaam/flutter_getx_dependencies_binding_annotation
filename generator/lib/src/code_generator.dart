/// Do not Import Get Library => package:get/get.dart';

import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import '../src/functions.dart';
import 'enums.dart';
import 'extensions.dart';

class CodeGenerator extends Generator {

  List<Element> pages = List<Element>.empty(growable: true);
  List<Element> controllers = List<Element>.empty(growable: true);
  List<Element> components = List<Element>.empty(growable: true);
  List<Element> repositories = List<Element>.empty(growable: true);


  @override
  FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) async {

    String? code;
    String? imports;

    if(library.element.source.uri.path.contains('main.dart')) {
      log('Code Generation on ${library.element.source.shortName} Started ...');
      code = '';
      imports = '';

      code = code.addCommentLine('Generated Library');
      code = code.addCommentLine('GetPut Main Library');
      code = code.addSpace();
      code = code.addCommentLine('GetPut Statistics:');
      code = code.addCommentLine('  Pages Length: ${pages.length}');
      code = code.addCommentLine('  Controllers Length: ${controllers.length}');
      code = code.addCommentLine('  Components Length: ${components.length}');
      code = code.addCommentLine('  Repositories Length: ${repositories.length}');
      code = code.addSpace();

      /// Imports
      imports = imports.addImport(ImportDependencies.main.url);
      imports = imports.addImport(ImportDependencies.get.url);

      String pagesBody = '';
      String pagesString = '';
      String initialPageString = '';
      String unknownPageString = '';
      for(var page in pages) {
        pagesString = pagesString + '\n$page;';
        // initialPageString = 'GetPage(name: \'/${page}\', page: ${page}.new)';
        // unknownPageString = 'GetPage(name: \'/${page}\', page: ${page}.new)';
      }

      pagesBody = pagesBody.addLine('static List<GetPage> pages = [${pagesString}\n];');
      pagesBody = pagesBody.addLine('static GetPage? initialPage = ${initialPageString.isEmpty ? null : initialPageString};');
      pagesBody = pagesBody.addLine('static GetPage? unknownPage = ${unknownPageString.isEmpty ? null : unknownPageString};');
      code = code.addClass(className: AnnotationTypes.pages.name.capitalizeFirst, body: pagesBody);

      String controllersBody = '';
      code = code.addBindingsClass(className: AnnotationTypes.controllers.name.capitalizeFirst, body: controllersBody);

      String componentsBody = '';
      code = code.addBindingsClass(className: AnnotationTypes.components.name.capitalizeFirst, body: componentsBody);

      String repositoriesBody = '';
      code = code.addBindingsClass(className: AnnotationTypes.repositories.name.capitalizeFirst, body: repositoriesBody);
    }

    return code == null ? null : generateCodeLibrary(imports: imports, code: code);
  }

  addPage(Element page) {
    pages.add(page);
    log('Page ${page.name} Added in Library');
  }

  addController(Element controller) {
    controllers.add(controller);
    log('Controller ${controller.name} Added in Library');
  }

  addComponent(Element component) {
    components.add(component);
    log('Component ${component.name} Added in Library');
  }

  addRepository(Element repository) {
    repositories.add(repository);
    log('Repository ${repository.name} Added in Library');
  }
}
