/// Annotation Class
library;

import 'enums.dart';

class GetPut {
  final String? as;
  final String? route;
  final bool? isInitial;
  final bool? isUnknown;
  final AnnotationTypes? type;

  const GetPut.page({this.as, this.route, this.isInitial, this.isUnknown}) : type = AnnotationTypes.page;
  const GetPut.controller({this.as}) : type = AnnotationTypes.controller, route = null, isInitial = null, isUnknown = null;
  const GetPut.component({this.as}) : type = AnnotationTypes.component, route = null, isInitial = null, isUnknown = null;
  const GetPut.repository({this.as}) : type = AnnotationTypes.repository, route = null, isInitial = null, isUnknown = null;
}
