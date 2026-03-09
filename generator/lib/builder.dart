import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'builders/annotation_builder.dart';
import 'builders/code_generator.dart';
import 'resources/constants.dart';

Builder annotationBuilder(BuilderOptions options) =>
    SharedPartBuilder([AnnotationBuilder()], PackageInfo.generatedFilesPrefix);

Builder codeGenerator(BuilderOptions options) =>
    LibraryBuilder(CodeGenerator(), generatedExtension: '.${PackageInfo.generatedFilesPrefix}.dart');
