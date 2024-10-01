import 'package:build/build.dart';
import 'package:getx_dependencies_binding_annotation_generator/src/generator.dart';
import 'package:source_gen/source_gen.dart';

Builder getxDependenciesBindingAnnotation(BuilderOptions options) => SharedPartBuilder(
      [GetXDependenciesBindingGenerator()],
      'getx_dependencies_binding_annotation',
    );
