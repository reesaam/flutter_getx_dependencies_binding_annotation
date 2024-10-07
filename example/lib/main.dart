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
      title: 'GetX Dependencies Binding Annotation',
      initialBinding: GetPutBindings(),
      getPages: GetPutPages.pages,
      // initialRoute: GetPutPages.initialPage?.name,
      // unknownRoute: GetPutPages.unknownPage,
    );
  }
}
