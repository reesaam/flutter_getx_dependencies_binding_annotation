import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../resources/enums.dart';

/// Extracted Data from [Annotation] will collect in this Model
class ExtractedInfoModel {
  final String name;
  final String? as;
  final DartType? asType;
  final Element element;
  final String source;
  final AnnotationTypes type;
  final bool? initialRoute;
  final bool? unknownRoute;
  final bool lazy;
  final bool fenix;

  ExtractedInfoModel({
    required this.name,
    this.as,
    this.asType,
    required this.element,
    required this.source,
    required this.type,
    this.initialRoute,
    this.unknownRoute,
    this.lazy = true,
    this.fenix = true,
  });
}
