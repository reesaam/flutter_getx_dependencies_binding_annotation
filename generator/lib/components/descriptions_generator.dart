class DescriptionGenerator {
  String result = '';

  String generate({String? name}) {
    _addLine(_caution);
    _addSpace();
    _addLine('Dependencies Binding Annotation Generator for GetX State Manager');
    _addLine('This file will provide mandatory dependencies for \"GetMaterialApp\"');
    _addLine('  Including:');
    _addLine('    - Pages');
    _addLine('    - Injected Dependencies:');
    _addLine('       - Controllers');
    _addLine('       - Components');
    _addLine('       - Repositories');
    _addBigSpace();
    _addLine('  Package:');
    _addLine('    Package Last Version: $_version');
    _addLine('    Package Name: $_packageName');
    _addLine('    Package Description: $_packageNameDescription');
    _addLine('    Package Address: $_packageAddress');
    _addLine('    Package GitHubRepositoryAddress: $_packageGitHubRepositoryAddress');
    _addBigSpace();
    _addLine('  Written and Provided by:');
    _addLine('    $_authorName');
    _addLine('    Email: $_emailAddress');
    _addLine('    Website: $_websiteAddress');
    _addLine('    LinkedIn: $_linkedinAddress');
    _addLine('    GitHub: $_githubAddress');
    _addSpace();
    return result;
  }

  String get _caution => 'GENERATED CODE - DO NOT MODIFY BY HAND EVER';
  String get _packageName => 'getx_dependencies_binding_annotation_generator';
  String get _packageNameDescription => 'Getx Dependencies Binding Annotation Generator';
  String get _packageAddress => '** Will Add in Next Update after First Publish **';
  String get _packageGitHubRepositoryAddress => 'https://github.com/reesaam/flutter_getx_dependencies_binding_annotation';
  String get _authorName => 'Resam Taghipour';
  String get _emailAddress => 'resam.t@gmail.com';
  String get _websiteAddress => 'https://www.resam-t.ir';
  String get _linkedinAddress => 'https://www.linkedin.com/in/resam';
  String get _githubAddress => 'https://github.com/reesaam';
  String get _version => '1.0.0';

  String _addLine(String line) => result += '/// $line\n';
  String _addSpace() => '///\n\n';
  String _addBigSpace() => '///\n\n\n\n';
}