// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// CodeGenerator
// **************************************************************************

/// /// GENERATED CODE - DO NOT MODIFY BY HAND EVER
/// Dependencies Binding Annotation Generator for GetX State Manager
/// This file will provide mandatory dependencies for "GetMaterialApp"
///   Including:
///     - Pages
///     - Injected Dependencies:
///        - Controllers
///        - Components
///        - Repositories
///   Package:
///     Package Last Version: 1.0.0
///     Package Name: getx_dependencies_binding_annotation_generator
///     Package Description: Getx Dependencies Binding Annotation Generator
///     Package Address: ** Will Add in Next Update after First Publish **
///     Package GitHubRepositoryAddress: https://github.com/reesaam/flutter_getx_dependencies_binding_annotation
///   Written and Provided by:
///     Resam Taghipour
///     Email: resam.t@gmail.com
///     Website: https://www.resam-t.ir
///     LinkedIn: https://www.linkedin.com/in/resam
///     GitHub: https://github.com/reesaam
///
///
///
///
///
///
///

import 'main.dart';
import 'package:get/get.dart';
import 'components/storage_component.dart';
import 'features/homepage/data/remote_data_source_repository.dart';
import 'features/homepage/data/local_data_source_repository.dart';
import 'features/homepage/controller/homepage_controller.dart';
import 'features/not_found/controller/not_found_controller.dart';
import 'features/homepage/view/homepage_view.dart';
import 'features/not_found/view/not_found_view.dart';

/// Generated Library
/// GetPut Main Library
/// GetPut Statistics:
///   Imports Count: 7
///   Pages Count: 2
///   Controllers Count: 2
///   Components Count: 1
///   Repositories Count: 2

class GetPutPages {
  static List<GetPage> get pages => [
        GetPage(name: '/HomePage', page: HomePage.new),
        GetPage(name: '/NotFoundPage', page: NotFoundPage.new),
      ];
}

class GetPutBindings implements Bindings {
  @override
  void dependencies() {
    _GetPutController().dependencies();
    _GetPutComponent().dependencies();
    _GetPutRepository().dependencies();
  }
}

class _GetPutController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController(), fenix: true);
    Get.lazyPut<NotFoundController>(() => NotFoundController(), fenix: true);
  }
}

class _GetPutComponent extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageComponentImpl>(() => StorageComponentImpl(),
        fenix: true);
  }
}

class _GetPutRepository extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSourceRepository>(
        () => RemoteDataSourceRepositoryImpl(),
        fenix: true);
    Get.lazyPut<LocalDataSourceRepository>(
        () => LocalDataSourceRepositoryImpl(),
        fenix: true);
  }
}
