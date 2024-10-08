import 'package:getx_dependencies_binding_annotation/getx_dependencies_binding_annotation.dart';

import '../../../core/core_view.dart';
import '../controller/not_found_controller.dart';

@GetPut.page(isUnknown: true)
class NotFoundPage extends CoreView<NotFoundController> {
  const NotFoundPage({super.key});
}
