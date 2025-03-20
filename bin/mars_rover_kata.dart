import 'package:mars_rover_kata/api.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main(List<String> arguments) async {
  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(_echoRequest);
  var server = await shelf_io.serve(Api().handler, 'localhost', 8080);
  server.autoCompress = true;
}

Response _echoRequest(Request request) =>
    Response.ok('Request for "${request.url}"');
