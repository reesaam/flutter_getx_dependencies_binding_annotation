import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:getx_dependencies_binding_annotation/annotation.dart';
import 'package:source_gen/source_gen.dart';

class GetXDependenciesBindingGenerator extends GeneratorForAnnotation<GetPut> {

  String code = '///Not Found';

  @override
  FutureOr<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {

    String? command;

    if (element.metadata.first.element != null && element.declaration != null && element.declaration!.name != null && element.declaration!.name!.isNotEmpty) {
      switch(element.metadata.first.element!.name) {
        case 'page': command = _addPage(element.declaration!.name!); break;
        case 'controller': command = _addController(element.declaration!.name!); break;
        case 'component': command = _addComponent(element.declaration!.name!); break;
        case 'repository': command = _addRepository(element.declaration!.name!); break;
        default: break;
      }
    }
    return code;
  }

  _addPage(String page) => 'GetPage(name: /${page}Route, page: ${page}.new)';
  _addController(String controller) => 'Get.lazyPut<${controller}>(() => ${controller}(), fenix: true);';
  _addComponent(String controller) => 'Get.lazyPut<${controller}>(() => ${controller}(), fenix: true);';
  _addRepository(String controller) => 'Get.lazyPut<${controller}>(() => ${controller}(), fenix: true);';

  _addLine(String line) => code = '\n$line';
}
