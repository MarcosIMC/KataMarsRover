import 'dart:math';

import 'package:mars_rover_kata/models/Orientation.dart';
import 'package:mars_rover_kata/models/mars.dart';
import 'package:mars_rover_kata/models/rover.dart';
import 'package:test/test.dart';

void main() {
  late Rover rover;
  late Mars mars;
  
  setUpAll(() {
    mars = Mars(10, 10);
    rover = Rover(0, 0, Orientation.NORTH, mars);
  });

  test('Create a new rover', () {
    expect(rover.currentPosition(), equals('0:0:NORTH'));
  });

  group('Rover should', () {

    test('move one position in y axis', () {
      rover.moveForward();
      expect(rover.currentPosition(), equals('0:1:NORTH'));
    });
    
    test('move five position in y axis and return 0:5:NORTH', () {
      for (var i = 0; i < 4; i++) {
        rover.moveForward();
      }
      expect(rover.currentPosition(), equals('0:5:NORTH'));
    });

    test('beyond the limits of the world and start at the beginning in x axis', () {
      for(var i = 0; i < 5; i++) {
        rover.moveForward();
      }
      expect(rover.currentPosition(), equals('0:0:NORTH'));
    });
    
    test('change orientation to West when give L command at current orientation is North', () {
      rover.turnLeft();
      expect(rover.currentOrientation(), equals(Orientation.WEST.name));
    });

    test('change orientation to South when give L command ant current orientation is West', () {
      rover.turnLeft();
      expect(rover.currentOrientation(), equals(Orientation.SOUTH.name));
    });

    test('change orientation to West when give R command and current orientation is South', () {
      rover.turnRight();
      expect(rover.currentOrientation(), equals(Orientation.WEST.name));
    });
  });
}
