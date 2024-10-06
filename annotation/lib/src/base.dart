/// Annotation Class
library;

import 'enums.dart';

class GetPut {
  final String? as;
  final AnnotationTypes? type;

  const GetPut.page({this.as}) : type = AnnotationTypes.page;
  const GetPut.controller({this.as}) : type = AnnotationTypes.controller;
  const GetPut.component({this.as}) : type = AnnotationTypes.component;
  const GetPut.repository({this.as}) : type = AnnotationTypes.repository;
}
