import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CoreController extends GetxController {
  BuildContext context = Get.context!;

  String? pageName;
}
