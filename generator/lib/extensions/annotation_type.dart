import '../resources/enums.dart';

/// Extensions on [String]
extension ConvertFromString on String {
  /// To find and get the Annotation Type
  AnnotationTypes get getAnnotationType => AnnotationTypes.values.firstWhere((value) => value.name == this);
}