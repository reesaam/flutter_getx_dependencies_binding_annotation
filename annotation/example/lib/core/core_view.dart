import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core_controller.dart';

abstract class CoreView<Controller extends CoreController> extends GetView<Controller> {
  const CoreView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(controller.pageName ?? '')),
      body: SafeArea(
          child: Column(children: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Text(controller.pageName ?? ''),
                ))),
      ])));
}
