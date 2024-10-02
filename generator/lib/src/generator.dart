import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:getx_dependencies_binding_annotation/annotation.dart';
import 'package:source_gen/source_gen.dart';

class GetXDependenciesBindingGenerator extends GeneratorForAnnotation<GetPut> {
  @override
  FutureOr<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {

    print(element);
    print(annotation);
    print(buildStep);

    return "// Hey! Annotation found!";
  }
}
