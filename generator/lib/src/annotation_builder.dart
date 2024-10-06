/// Do not Import Get Library => package:get/get.dart';

import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:getx_dependencies_binding_annotation/annotation.dart';
import 'package:source_gen/source_gen.dart';

import 'enums.dart';
import 'extensions.dart';
import 'functions.dart';

class AnnotationBuilder extends GeneratorForAnnotation<GetPut> {
  @override
  FutureOr<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {

    log('Annotation Found in ${element.source?.uri.path} ...');
    log('Annotation Build for ${element.name} Started ...');

    String code = '///Annotation';
    String imports = '';

    code = code.addSpace();

    log(element.metadata.first.element?.name);

    ///Imports
    if(element.source != null && element.source?.uri.path != null) {
      imports = imports.addImport(element.source!.uri.path);
    }
    imports = imports.addImport(ImportDependencies.get.url);

    var elementName = element.name;

    if(element.metadata.first.element?.name == AnnotationTypes.pages.elementName) {
      code = code.addPage(elementName);
      log('Page ${element.name} Added');
    } else if(element.metadata.first.element?.name == AnnotationTypes.controllers.elementName) {
      code = code.addController(elementName);
      log('Controller ${element.name} Added');
    } else if(element.metadata.first.element?.name == AnnotationTypes.components.elementName) {
      code = code.addComponent(elementName);
      log('Component ${element.name} Added');
    } else if(element.metadata.first.element?.name == AnnotationTypes.repositories.elementName) {
      code = code.addRepository(elementName);
      log('Repository ${element.name} Added');
    }

    return generateCode(imports: imports, code: code);
  }
}
