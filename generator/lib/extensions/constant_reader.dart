import 'package:source_gen/source_gen.dart';

import '../resources/strings.dart';

/// Extension on [ConstantReader]
extension GetData on ConstantReader {

  /// GetIsInitial Extension on [ConstantReader]
  bool? get getIsInitial => revive().namedArguments[Strings.annotationArgumentIsInitial]?.toBoolValue();

  /// GetIsUnknownRoute Extension on [ConstantReader]
  bool? get getIsUnknownRoute => revive().namedArguments[Strings.annotationArgumentIsUnknown]?.toBoolValue();

  /// GetLazy Extension on [ConstantReader]
  bool get getLazy => revive().namedArguments[Strings.annotationArgumentLazy]?.toBoolValue() ?? true;

  /// GetAs Extension on [ConstantReader]
  String? get getAs => revive().namedArguments[Strings.annotationArgumentAs]?.toStringValue();

  /// GetFenix Extension on [ConstantReader]
  bool get getFenix => revive().namedArguments[Strings.annotationArgumentFenix]?.toBoolValue() ?? true;
}
