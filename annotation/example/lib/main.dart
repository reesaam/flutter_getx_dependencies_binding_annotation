import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/getx_binding_annotation.dart';

/// ==> Import the Generated File
import 'main.get_put.dart';

void main() {
  /// ==> Binding Function in App Initialization
  GetPutBindings().dependencies();
  /// ==> Then [Run] your App
  runApp(const MainApp());
}

/// An [InitialPage] should be introduces
@GetPut.page(isInitial: true)
class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) => SizedBox.shrink();
}

/// How Controllers can be implemented
/// [HomePageController] should be implemented if [HomePage] is implementing and needs a controller
@GetPut.controller()
class HomePageController extends GetxController {}

/// An [UnknownPage] should be introduces
@GetPut.page(isUnknown: true)
class NotFoundPage extends GetView<NotFoundController> {
  @override
  Widget build(BuildContext context) => SizedBox.shrink();
}

/// How Controllers can be implemented
/// [NotFoundController] should be implemented if [NotFoundPage] is implementing and needs a controller
@GetPut.controller()
class NotFoundController extends GetxController {}

/// How [Repositories] can be implemented
abstract class RemoteDataSourceRepository {}

@GetPut.repository(as: RemoteDataSourceRepository)
class RemoteDataSourceRepositoryImpl implements RemoteDataSourceRepository {}

/// How [Components] can be implemented
abstract class StorageComponent {}

@GetPut.component()
class StorageComponentImpl implements StorageComponent {}

/// How [Services] can be implemented
@GetPut.service()
class LoggerService extends GetxService {}

/// [GetMaterialApp] configuration
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App Name',
      /// ==> You [MUST] set these four functions and variables in your Project
      initialBinding: GetPutBindings(), /// Inject all dependencies
      getPages: GetPutPages.pages, /// Add all the pages in GetX context
      initialRoute: GetPutPages.initialRoute, /// Set initial route
      unknownRoute: GetPutPages.unknownRoute, /// Set a route for any unknown or undefined route in the app
    );
  }
}
