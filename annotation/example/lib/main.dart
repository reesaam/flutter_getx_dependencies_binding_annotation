import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';

/// ==> Import the Generated File
import 'main.get_put.dart';

void main() {
  /// ==> Binding Function in App Initialization
  GetPutBindings().dependencies();
  runApp(const MainApp());
}

@GetPut.page(isInitial: true)
class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) => SizedBox.shrink();
}

@GetPut.controller()
class HomePageController extends GetxController {}

@GetPut.page(isUnknown: true)
class NotFoundPage extends GetView<NotFoundController> {
  @override
  Widget build(BuildContext context) => SizedBox.shrink();
}

@GetPut.controller()
class NotFoundController extends GetxController {}

abstract class RemoteDataSourceRepository {}

@GetPut.repository(as: RemoteDataSourceRepository)
class RemoteDataSourceRepositoryImpl implements RemoteDataSourceRepository {}

abstract class StorageComponent {}

@GetPut.component()
class StorageComponentImpl implements StorageComponent {}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App Name',
      /// ==> You must set these four functions and variables in your Project
      initialBinding: GetPutBindings(), /// Inject all dependencies
      getPages: GetPutPages.pages, /// Add all the pages in GetX context
      initialRoute: GetPutPages.initialRoute.name, /// Set initial route
      unknownRoute: GetPutPages.unknownRoute, /// Set a route for any unknown or undefined route in the app
    );
  }
}
