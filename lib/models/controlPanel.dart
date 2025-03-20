import 'package:mars_rover_kata/models/command.dart';

class ControlPanel {
  final List<Command> _commands = [];

  void addCommand(Command command) {
    _commands.add(command);
  }

  void executeCommands() {
    for (var command in _commands) {
      command.execute();
    }
    _commands.clear();
  }
}