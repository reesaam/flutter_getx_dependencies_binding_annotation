// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// CodeGenerator
// **************************************************************************

library;

/// ///  GENERATED CODE - DO NOT MODIFY BY HAND EVER

///  Dependencies binding annotation generator for [ GetX State Manager ]
///  This file will provide mandatory dependencies for [ GetMaterialApp ]
///    Including:
///      - Pages
///      - Injected Dependencies:
///        - Controllers
///        - Components
///        - Repositories

///  Generator will generate a file with '.get_put.dart' format in the lib/ root fot using in 'main.dart'
///  You can see how to use the generated class in the main in the GetMaterialApp as [example]

///  Package:
///    Package Last Version: [ 1.0.0 ]
///    Package Name: [ getx_binding_annotation_generator ]
///    Package Description: [ Getx Dependencies Binding Annotation Generator ]
///    Package Address: [ ** Will Add in Next Update after First Publish ** ]
///    Package GitHubRepositoryAddress: [ https://github.com/reesaam/flutter_getx_dependencies_binding_annotation ]

///  Written and Provided by:
///    [ Resam Taghipour ]
///    Email: [ resam.t@gmail.com ]
///    Website: [ https://www.resam-t.ir ]
///    LinkedIn: [ https://www.linkedin.com/in/resam ]
///    GitHub: [ https://github.com/reesaam ]

import 'package:get/get.dart';
import 'main.dart';

/// Generated Library Statistics:
///   Imports Count: 1
///   Pages Count: 2
///   Controllers Count: 2
///   Components Count: 1
///   Repositories Count: 1

class GetPutPages {
  static List<GetPage> get pages => [
        GetPage(name: '/HomePage', page: HomePage.new),
        GetPage(name: '/NotFoundPage', page: NotFoundPage.new),
      ];
  static GetPage get initialRoute =>
      GetPage(name: '/HomePage', page: HomePage.new);
  static GetPage get unknownRoute =>
      GetPage(name: '/NotFoundPage', page: NotFoundPage.new);
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
    Get.lazyPut<RemoteDataSourceRepositoryImpl>(
        () => RemoteDataSourceRepositoryImpl(),
        fenix: true);
  }
}
