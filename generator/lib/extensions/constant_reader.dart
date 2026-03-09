import 'package:source_gen/source_gen.dart';

import '../resources/strings.dart';

extension GetData on ConstantReader {
  bool? get getIsInitial => revive().namedArguments[Strings.annotationArgumentIsInitial]?.toBoolValue();
  bool? get getIsUnknownRoute => revive().namedArguments[Strings.annotationArgumentIsUnknown]?.toBoolValue();
  bool get getLazy => revive().namedArguments[Strings.annotationArgumentLazy]?.toBoolValue() ?? true;
  String? get getAs => revive().namedArguments[Strings.annotationArgumentAs]?.toStringValue();
  bool get getFenix => revive().namedArguments[Strings.annotationArgumentFenix]?.toBoolValue() ?? true;
}
