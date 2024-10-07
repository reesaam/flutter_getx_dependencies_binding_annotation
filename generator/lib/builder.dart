import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'builders/annotation_builder.dart';
import 'builders/code_generator.dart';
import 'resources/constants.dart';

Builder annotationBuilder(BuilderOptions options) => SharedPartBuilder([AnnotationBuilder()], generatedFilesPrefix);

Builder codeGenerator(BuilderOptions options) => LibraryBuilder(CodeGenerator(), generatedExtension: '.$generatedFilesPrefix.dart');
