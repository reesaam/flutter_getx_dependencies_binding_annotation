import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:getx_binding_annotation/annotation.dart';
import 'package:source_gen/source_gen.dart';

import '../extensions/annotation_type.dart';
import '../extensions/constant_reader.dart';
import '../models/extracted_info_model.dart';
import '../resources/enums.dart';
import '../resources/strings.dart';
import 'code_generator.dart';
import '../components/log.dart';

/// This class will find the Annotation, Extract Data then Fill it in the Model to pass to the main generator class to generate the Code
///
/// The DataModel includes the source element itself and extracted useful data that we know will use them a lot
/// so, those useful data seperated and assigned a specific field for them
/// we would not process the demanded data everytime
///
/// Logs will notify that an annotation has founded, then it will show details about that

class AnnotationBuilder extends GeneratorForAnnotation<GetPut> {
  @override
  FutureOr<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {

    // Extracting Data from all Elements and filling the data into a model to use everywhere
    ExtractedInfoModel dataModel = ExtractedInfoModel(
      element: element,
      source: element.source?.uri.path ?? Strings.unknown,
      type: element.metadata.first.element?.name?.getAnnotationType ?? AnnotationTypes.unknown,
      name: element.name ?? Strings.unknown,
      as: annotation.getAs,
      initialRoute: annotation.getIsInitial,
      unknownRoute: annotation.getIsUnknownRoute,
    );

    // Logging details about founded Annotation
    GeneratorLog.info(title: 'Annotation Found in', data: dataModel.source);
    GeneratorLog.info(title: 'Annotation Name', data: dataModel.name, as: dataModel.as);
    GeneratorLog.info(title: 'Annotation Type', data: dataModel.type);
    GeneratorLog.space();

    // Adding the Element in the main Generator
    CodeGenerator().addElement(dataModel);
    return Strings.empty;
  }
}
