import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      // initialBinding: CoreBindings(),
      // getPages: AppPages.pages,
      // initialRoute: AppRoutes.splashScreen.route,
      // unknownRoute: AppPages.unknownRoute,
    );
  }
}
