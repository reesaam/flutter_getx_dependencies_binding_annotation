import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';
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
      source: element.library?.uri.path ?? Strings.unknown,
      type: element.metadata.annotations.first.element?.name?.getAnnotationType ?? AnnotationTypes.unknown,
      name: element.name ?? Strings.unknown,
      as: annotation.getAs,
      initialRoute: annotation.getIsInitial,
      unknownRoute: annotation.getIsUnknownRoute,
      lazy: annotation.getLazy,
    );

    // Logging details about founded Annotation
    GeneratorLog.info(title: '${dataModel.type} Annotation ${dataModel.name} ${dataModel.as == null ? '' : 'as ${dataModel.as}'} Found in', data: dataModel.source);
    GeneratorLog.space();

    // Adding the Element in the main Generator
    final bool isAbstract = element.baseElement.toString().contains('abstract');
    if (isAbstract) {
      GeneratorLog.error(title: '${dataModel.name} can\'t be generated', data: 'abstract classes can\'t be generated');
      throw Exception('On ${dataModel.name} error occurred, abstract classes can\'t be generated');
    } else {
      CodeGenerator().addElement(dataModel);
    }
    return Strings.empty;
  }
}
