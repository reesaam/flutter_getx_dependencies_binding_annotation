import 'package:getx_dependencies_binding_annotation/getx_dependencies_binding_annotation.dart';

import '../../../core/core_controller.dart';

@GetPut.controller()
class HomePageController extends CoreController {

  @override
  String? get pageName => 'HomePage';
}
