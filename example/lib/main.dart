import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.get_put.dart';
import 'resources/info.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: PackageAuthorInfo.packageNameDescription,
      /// You must set these four functions and variables in your Project
      initialBinding: GetPutBindings(), // Inject all dependencies
      getPages: GetPutPages.pages, // Add all the pages in GetX context
      initialRoute: GetPutPages.initialRoute.name, // Set initial route
      unknownRoute: GetPutPages.unknownRoute, // Set a route for any unknown or undefined route in the app
    );
  }
}
