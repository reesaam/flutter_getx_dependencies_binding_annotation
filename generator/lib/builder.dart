import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/annotation_builder.dart';
import 'src/code_generator.dart';

String prefix = 'get_put';

Builder annotationBuilder(BuilderOptions options) => SharedPartBuilder(
      [AnnotationBuilder()], prefix,
    );

Builder codeGenerator(BuilderOptions options) => LibraryBuilder(
      CodeGenerator(),
      generatedExtension: '.$prefix.dart',
    );
