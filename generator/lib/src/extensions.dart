extension GeneralAdds on String {
  String addLine(String line) => '$this\n$line';
  String addSpace() => addLine('\n\n');
  String addCommentLine(String line) => addLine('/// $line');
}

extension AddCommands on String {
  String addImport(String path) => addLine('import \'$path\';');
  String addClass({required String className, required String body}) => addLine('class GetPut$className {\n$body\n}');
  String addBindingsClass({required String className, required String body}) => addLine('class _GetPut$className extends Bindings {\n@override\nvoid dependencies() {\n$body\n}\n}');
}

extension AddElements on String {
  String addPage(page) => addClass(className: page, body: 'static GetPage page = GetPage(name: \'/${page}\', page: ${page}.new);');
  String addController(controller) => addClass(className: controller, body: 'static GetController controller = Get.lazyPut<${controller}>(() => ${controller}(), fenix: true);');
  String addComponent(component) => addClass(className: component, body: 'static GetController component = Get.lazyPut<${component}>(() => ${component}(), fenix: true);');
  String addRepository(repository) => addClass(className: repository, body: 'static GetController repository = Get.lazyPut<${repository}>(() => ${repository}(), fenix: true);');
}

extension StringManipulate on String {
  String get capitalizeFirst => this.replaceRange(0, 1, this[0].toUpperCase());
}