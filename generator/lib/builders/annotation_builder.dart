import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:getx_dependencies_binding_annotation/annotation.dart';
import 'package:source_gen/source_gen.dart';

import '../extensions/annotation_type.dart';
import '../extensions/constant_reader.dart';
import '../models/extracted_info_model.dart';
import '../resources/enums.dart';
import '../resources/strings.dart';
import 'code_generator.dart';
import '../components/log.dart';

class AnnotationBuilder extends GeneratorForAnnotation<GetPut> {
  @override
  FutureOr<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {

    ExtractedInfoModel dataModel = ExtractedInfoModel(
      element: element,
      source: element.source?.uri.path ?? Strings.unknown,
      type: element.metadata.first.element?.name?.getAnnotationType ?? AnnotationTypes.unknown,
      name: element.name ?? Strings.unknown,
      as: annotation.getAs,
      initialRoute: annotation.getIsInitial,
      unknownRoute: annotation.getIsUnknownRoute,
    );

    log.info(title: 'Annotation Found in', data: dataModel.source);
    log.info(title: 'Annotation Name', data: dataModel.name, as: dataModel.as);
    log.info(title: 'Annotation Type', data: dataModel.type);
    log.space();

    CodeGenerator().addElement(dataModel);
    return Strings.empty;
  }
}
