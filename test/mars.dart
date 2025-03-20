import 'package:mars_rover_kata/mars_rover_kata.dart';
import 'package:mars_rover_kata/models/mars.dart';
import 'package:test/test.dart';

void main() {
  group('Mars should', () {
    test('Create a new world', () {
      var mars = Mars(10, 10);

      expect(mars.width, equals(10));
      expect(mars.height, equals(10));
    });
    
    test('Show a throw when try create a world with negative values', () {
      expect(() => Mars(-5, 10), throwsArgumentError);
    });
  });
}
