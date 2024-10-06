enum AnnotationTypes {
  pages('page'),
  controllers('controller'),
  components('component'),
  repositories('repository');

  final String elementName;
  const AnnotationTypes(this.elementName);
}

enum ImportDependencies {
  main(url: 'main.dart'),
  getDependenciesBindingAnnotation(url: 'package:getx_dependencies_binding_annotation/annotation.dart'),
  coreView(url: '../../../core/core_view.dart'),
  coreController(url: '../../../core/core_controller.dart'),
  dartAsync(url: 'dart:async'),
  get(url: 'package:get/get.dart'),
  material(url: 'package:flutter/material.dart');

  final String url;
  const ImportDependencies({required this.url});
}