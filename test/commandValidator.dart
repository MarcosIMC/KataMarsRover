import 'package:mars_rover_kata/models/commandValidator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late CommandValidator commandValidator;

  setUpAll(() {
    commandValidator = CommandValidator();
  });

  group('Command Validator should', () {
    test('Return false when check if a valid command is invalid', () {
     expect(commandValidator.isInvalidCommands('M'), isFalse);
     expect(commandValidator.isInvalidCommands('MMM'), isFalse);
     expect(commandValidator.isInvalidCommands('MMRMMLM'), isFalse);
    });

    test('Return true when check if a wrong command is invalid', () {
      expect(commandValidator.isInvalidCommands('S'), isTrue);
      expect(commandValidator.isInvalidCommands('MRSM'), isTrue);
      expect(commandValidator.isInvalidCommands('MMRMS'), isTrue);
    });
  });
}