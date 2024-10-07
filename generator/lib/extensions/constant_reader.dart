import 'package:source_gen/source_gen.dart';

extension GetData on ConstantReader {
  bool? get getIsInitial => revive().namedArguments['isInitial']?.toBoolValue();
  bool? get getIsUnknownRoute => revive().namedArguments['isUnknown']?.toBoolValue();
  String? get getAs => revive().namedArguments['as']?.toStringValue();
}