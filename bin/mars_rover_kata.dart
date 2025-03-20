import 'dart:io';

import 'package:mars_rover_kata/mars_rover_kata.dart' as mars_rover_kata;
import 'package:mars_rover_kata/models/Orientation.dart';
import 'package:mars_rover_kata/models/commandValidator.dart';
import 'package:mars_rover_kata/models/controlPanel.dart';
import 'package:mars_rover_kata/models/mars.dart';
import 'package:mars_rover_kata/models/rover.dart';
import 'package:mars_rover_kata/models/roverCommand.dart';

void main(List<String> arguments) {
  final mars = Mars(10, 10);
  final rover = Rover(0, 0, Orientation.NORTH, mars);
  final controlPanel = ControlPanel();
  final commandValidator = CommandValidator();

  String? input = stdin.readLineSync();

  if (commandValidator.isInvalidCommands(input!)) {
    throw ArgumentError();
  }

  for(var command in input.split('')) {
    switch(command) {
      case 'M':
        controlPanel.addCommand(MoveCommand(rover));
        break;
      case 'L':
        controlPanel.addCommand(TurnLeftCommand(rover));
        break;
      case 'R':
        controlPanel.addCommand(TurnRightCommand(rover));
        break;
    }
  }

  controlPanel.executeCommands();

  print(rover.currentPosition());
}
