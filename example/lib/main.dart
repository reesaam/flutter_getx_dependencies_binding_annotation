import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.get_put.dart';

void main() => initProject();

void initProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Getx Dependencies Binding Annotation Generator',
      initialBinding: GetPutBindings(),
      getPages: GetPutPages.pages,
      initialRoute: GetPutPages.initialRoute.name,
      unknownRoute: GetPutPages.unknownRoute,
    );
  }
}
