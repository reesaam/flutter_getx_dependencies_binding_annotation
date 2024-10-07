import '../resources/enums.dart';

extension ConvertFromString on String {
  AnnotationTypes get getAnnotationType => AnnotationTypes.values.firstWhere((value) => value.name == this);
}