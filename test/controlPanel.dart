import 'package:mars_rover_kata/models/Orientation.dart';
import 'package:mars_rover_kata/models/controlPanel.dart';
import 'package:mars_rover_kata/models/mars.dart';
import 'package:mars_rover_kata/models/rover.dart';
import 'package:mars_rover_kata/models/roverCommand.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late Rover rover;
  late Mars mars;
  late ControlPanel controlPanel;

  setUp(() {
    mars = Mars(10, 10);
    rover = Rover(0, 0, Orientation.NORTH, mars);
    controlPanel = ControlPanel();
  });

  group('Control Panel should', () {
    test('Return West orientation when use TurnLeft command', () {
      controlPanel.addCommand(TurnLeftCommand(rover));
      controlPanel.executeCommands();

      expect(rover.currentOrientation(), equals(Orientation.WEST.name));
    });

    test('Return East orientation when use TurnRight command', (){
      controlPanel.addCommand(TurnRightCommand(rover));
      controlPanel.executeCommands();

      expect(rover.currentOrientation(), equals(Orientation.EAST.name));
    });
    
    test('Move the rover one position in y axis', (){
      controlPanel.addCommand(MoveCommand(rover));
      controlPanel.executeCommands();
      
      expect(rover.currentPosition(), equals('0:1:NORTH'));
    });

    test('Move the rover one position in x axis and orientation to East', (){
      controlPanel.addCommand(TurnRightCommand(rover));
      controlPanel.addCommand(MoveCommand(rover));
      controlPanel.executeCommands();

      expect(rover.currentPosition(), equals('1:0:EAST'));
    });

    test('Move rover some position when send a sequency of commands', (){
      controlPanel.addCommand(MoveCommand(rover));
      controlPanel.addCommand(MoveCommand(rover));
      controlPanel.addCommand(TurnRightCommand(rover));
      controlPanel.addCommand(MoveCommand(rover));
      controlPanel.addCommand(MoveCommand(rover));
      controlPanel.addCommand(TurnLeftCommand(rover));
      controlPanel.addCommand(MoveCommand(rover));
      controlPanel.executeCommands();

      expect(rover.currentPosition(), equals('2:3:NORTH'));
    });
  });

}