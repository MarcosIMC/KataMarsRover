import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'models/Orientation.dart';
import 'models/commandValidator.dart';
import 'models/controlPanel.dart';
import 'models/mars.dart';
import 'models/rover.dart';
import 'models/roverCommand.dart';

class Api {
  final rover = Rover(0, 0, Orientation.NORTH, Mars(10, 10));
  final controlPanel = ControlPanel();
  final commandValidator = CommandValidator();

  Handler get handler {
    final router = Router();

    //Post commands to rover
    router.post('/commands', (Request request) async {
      final body = jsonDecode(await request.readAsString());
      var commands = body['commands'];
      if (commandValidator.isInvalidCommands(await commands)) {
        return Response.badRequest(body: 'Command sequency invalid');
        //throw ArgumentError();
      }

      for(var command in await commands.split('')) {
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

      return Response.ok(
        jsonEncode({
          'success': true,
          'currentPosition': rover.currentPosition()
        }),
        headers: {
          'Content-type':'application/json'
        }
      );
    });

    //Get current position
    router.get('/position', (Request request) async {
      return Response.ok(
        jsonEncode({
          'success': true,
          'currentPosition': rover.currentPosition()
        })
      );
    });

    //Get current orientation
    router.get('/orientation', (Request request) async {
      return Response.ok(
        jsonEncode({
          'success': true,
          'currentOrientation': rover.currentOrientation()
        })
      );
    });

    return router;
  }
}