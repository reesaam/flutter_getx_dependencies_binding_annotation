import 'enums.dart';
import 'extensions.dart';

log(String? log) => print('[GetPut]  ${log ?? 'NULL'}');

String? generateCodeLibrary({String? imports, String? code}) {
  String codeBody = '';
  // imports == null ? null : codeBody = codeBody.addLine(imports);
  // codeBody.addSpace();

  codeBody = codeBody.addLine('part of \'main.dart\';');

  code == null ? null : codeBody = codeBody.addLine(code);

  List<String> dependenciesStrings = List<String>.generate(
      AnnotationTypes.values.length, (index) => AnnotationTypes.values[index] == AnnotationTypes.pages ? '' : '_GetPut${AnnotationTypes.values[index].name.capitalizeFirst}().dependencies();');
  String dependencies = '';
  dependencies = dependencies.addLine('class GetPutBindings implements Bindings {\n@override\nvoid dependencies() {');
  for (var dep in dependenciesStrings) {
    dependencies = dependencies.addLine(dep);
  }
  dependencies = dependencies.addLine('\n}\n}');
  codeBody = codeBody.addLine(dependencies);

  return codeBody.isEmpty ? null : codeBody;
}

String generateCode({String? imports, String? code}) {
  String codeBody = '';
  imports == null ? null : codeBody = codeBody.addLine(imports);
  codeBody.addSpace();
  code == null ? null : codeBody = codeBody.addLine(code);
  return codeBody;
}
