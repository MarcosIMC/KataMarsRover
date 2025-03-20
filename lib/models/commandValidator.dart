class CommandValidator {
  bool _validCommands(String commands) {
    return RegExp(r'^[MLR]+$').hasMatch(commands);
  }

  bool isInvalidCommands(String commands) {
    return !_validCommands(commands);
  }
}