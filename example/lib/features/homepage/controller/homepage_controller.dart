import 'package:getx_dependencies_binding_annotation/annotation.dart';

import '../../../core/core_controller.dart';

@GetPut.controller
class HomePageController extends CoreController {

  @override
  String? get pageName => 'HomePage';
}
