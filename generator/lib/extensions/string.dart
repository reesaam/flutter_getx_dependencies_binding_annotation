import '../resources/constants.dart';

extension GeneralCodeAddTools on String {
  String addLine(String line) => '$this\n$line';
  String addSpace() => addLine('\n\n');
  String addCommentLine(String line) => addLine('/// $line');
}

extension GeneralCodeSnippetAddTools on String {
  String addImport(String path) => addLine('import \'${path}\';');
  String addClass({required String className, required String body}) => addLine('class $elementsMainName$className {$body}');
  String addDependencyClass({required String className, required String body}) => addLine('class _$elementsMainName$className extends Bindings {@override void $generatedFilesDependenciesPostfix() {$body}}');
  String addBindingClass({required String body}) => addLine('class ${elementsMainName}Bindings implements Bindings {@override void $generatedFilesDependenciesPostfix() {${body}}}');
}

extension StringManipulators on String {
  String get capitalizeFirst => this.replaceRange(0, 1, this[0].toUpperCase());
  String get correctImport => '${this.replaceFirst('${this.split('/').first}/', '')}';
}
