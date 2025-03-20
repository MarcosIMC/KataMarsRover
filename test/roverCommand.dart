import 'package:mars_rover_kata/models/Orientation.dart';
import 'package:mars_rover_kata/models/mars.dart';
import 'package:mars_rover_kata/models/rover.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late Mars mars;
  late Rover rover;
  
  setUp(() {
    mars = Mars(10, 10);
    rover = Rover(0, 0, Orientation.NORTH, mars);
  });

  group('Rover command should', () {
    test('Change the orientation North to West when turn to left', () {
      rover.turnLeft();
      expect(rover.currentOrientation(), equals(Orientation.WEST.name));
    });

    test('Change the orientation North to East when turn to right', (){
      rover.turnRight();
      expect(rover.currentOrientation(), equals(Orientation.EAST.name));
    });

    test('Move one position in y axis', (){
      rover.moveForward();
      expect(rover.currentPosition(), equals('0:1:NORTH'));
    });

    test('Move one position in x axis and change orientation to East', () {
      rover.turnRight();
      rover.moveForward();
      expect(rover.currentPosition(), equals('1:0:EAST'));
    });

    test('Move some positions and orientation when send a sequency of commands', (){
      rover.moveForward();
      rover.moveForward();
      rover.turnRight();
      rover.moveForward();
      rover.moveForward();
      rover.turnLeft();
      rover.moveForward();

      expect(rover.currentPosition(), equals('2:3:NORTH'));
    });
  });
}