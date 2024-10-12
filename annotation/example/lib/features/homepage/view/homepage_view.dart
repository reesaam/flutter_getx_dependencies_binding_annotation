import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_view.dart';
import '../controller/homepage_controller.dart';

@GetPut.page(isInitial: true)
class HomePage extends CoreView<HomePageController> {
  const HomePage({super.key});

}
