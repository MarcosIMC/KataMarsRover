class Mars {
  var _height;
  var _width;

  Mars(this._height, this._width) {
   if (this._height < 0 || this._width < 0) {
     throw ArgumentError();
   }
  }

  get width => _width;

  set width(value) {
    _width = value;
  }

  get height => _height;

  set height(value) {
    _height = value;
  }

  Map<String, int> wrapPosition(x, y) {
    return {
      'x': (x + width) % width,
      'y': (y + height) % height
    };
  }
}