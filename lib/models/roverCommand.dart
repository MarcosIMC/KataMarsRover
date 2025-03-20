import 'package:mars_rover_kata/models/command.dart';
import 'package:mars_rover_kata/models/rover.dart';

class MoveCommand implements Command {
  final Rover rover;

  MoveCommand(this.rover);

  @override
  void execute() {
    // TODO: implement execute
    rover.moveForward();
  }
}

class TurnLeftCommand implements Command {
  final Rover rover;

  TurnLeftCommand(this.rover);

  @override
  void execute() {
    // TODO: implement execute
    rover.turnLeft();
  }
}

class TurnRightCommand implements Command {
  final Rover rover;

  TurnRightCommand(this.rover);

  @override
  void execute() {
    // TODO: implement execute
    rover.turnRight();
  }
}