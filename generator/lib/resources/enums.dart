enum AnnotationTypes {
  page,
  controller,
  component,
  repository,
  unknown,
}

enum ImportDependencies {
  main(url: 'main.dart'),
  get(url: 'package:get/get.dart'),
  material(url: 'package:flutter/material.dart'),
  dartAsync(url: 'dart:async'),
  getDependenciesBindingAnnotation(url: 'package:getx_binding_annotation/annotation.dart');

  final String url;
  const ImportDependencies({required this.url});
}

enum LogType {
  normal(''),
  info('Info'),
  warning('Warning'),
  error('Error');

  final String typeName;
  const LogType(this.typeName);
}