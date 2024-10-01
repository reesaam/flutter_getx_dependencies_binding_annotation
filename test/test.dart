import 'package:getx_dependencies_binding_annotation/annotation.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final getPut = GetPut();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(getPut, isTrue);
    });
  });
}
