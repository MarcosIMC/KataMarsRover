import 'package:mars_rover_kata/models/mars.dart';

import 'Orientation.dart';

class Rover {
  late int _x;
  late int _y;
  Orientation _orientation;
  final Mars mars;

  Rover(this._x, this._y, this._orientation, this.mars);

  int get y => _y;

  set y(int value) {
    _y = value;
  }

  int get x => _x;

  set x(int value) {
    _x = value;
  }

  String currentPosition() {
    return '$x:$y:${_orientation.name}';
  }

  String currentOrientation() {
    return _orientation.name;
  }

  void moveForward() {
    switch(_orientation) {
      case Orientation.NORTH:
        y++;
        break;
      case Orientation.SOUTH:
        y--;
        break;
      case Orientation.EAST:
        x++;
        break;
      case Orientation.WEST:
        x--;
        break;
    }

    var newPosition = mars.wrapPosition(x, y);
    x = newPosition['x']!;
    y = newPosition['y']!;
  }

  void turnLeft() {
    final leftOrientation = {
      Orientation.NORTH: Orientation.WEST,
      Orientation.WEST: Orientation.SOUTH,
      Orientation.SOUTH: Orientation.EAST,
      Orientation.EAST: Orientation.NORTH
    };
    _orientation = leftOrientation[_orientation]!;
  }

  void turnRight() {
    final rightOrientation = {
      Orientation.NORTH: Orientation.EAST,
      Orientation.WEST: Orientation.NORTH,
      Orientation.SOUTH: Orientation.WEST,
      Orientation.EAST: Orientation.SOUTH
    };
    _orientation = rightOrientation[_orientation]!;
  }
}