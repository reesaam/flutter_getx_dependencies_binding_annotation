import '../resources/constants.dart';
import '../resources/strings.dart';

extension GeneralCodeAddTools on String {
  String addLine(String line, {bool? space}) => '${space == true ? Strings.space : Strings.empty}$this\n$line';
  String addLineWithSpace(String line) => addLine(line, space: true);
  String addSpaceAfter() => addLine('\n\n');
  String addCommentLine(String line, {bool? space}) => addLine('///${space == true ? Strings.space : Strings.empty} $line');
  String addCommentLineWithSpace(String line) => addCommentLine(line, space: true);
}

extension GeneralCodeSnippetAddTools on String {
  String addImport(String path) => addLine('import \'$path\';');
  String addClass({required String className, required String body}) =>
      addLine('class ${PackageInfo.elementsMainName}$className {$body}');
  String addDependencyClass({required String className, required String body}) => addLine(
      'class _${PackageInfo.elementsMainName}$className extends Bindings {@override void ${PackageInfo.generatedFilesDependenciesPostfix}() {$body}}');
  String addBindingClass({required String body}) => addLine(
      'class ${PackageInfo.elementsMainName}Bindings implements Bindings {@override void ${PackageInfo.generatedFilesDependenciesPostfix}() {$body}}');
}

extension StringManipulators on String {
  String get capitalizeFirst => replaceRange(0, 1, this[0].toUpperCase());
  String get correctImport => replaceFirst('${split('/').first}/', '');
}
