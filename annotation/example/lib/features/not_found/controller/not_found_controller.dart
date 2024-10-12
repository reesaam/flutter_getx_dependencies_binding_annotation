import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_controller.dart';

@GetPut.controller()
class NotFoundController extends CoreController {

  @override
  String? get pageName => 'Not Found';
}
