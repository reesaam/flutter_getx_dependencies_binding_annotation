/// Annotation Class
library;

/// This is the Base Annotation Class which provides Types and Options for the Annotation
///
/// The Annotation has several Types, but it couldn't use by itself, it should use by one of the types
/// Every [type] has it's options which provides some features of each type, options are specifically recognized by the type
///
/// Types are known as a enum, but users will see them as a constructor and this is the only way of using this Annotation
///
/// [as] will use as rename the class for the DI
/// [route] will use just for pages, basically, route will generate by the plugin and all pages have a route, they should have
/// this option will provide the ability of changing the route and assign a special route for a page

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
