import 'dart:async';
import 'package:socket_io/socket_io.dart';

void main() {
  final server = Server();
  server.on('connection', (client) {
    print('Client connected');
    client.on('stream', (data) => print('Data: $data'));
    Timer(Duration(seconds: 5), () {
      client.emit('msg', 'Hello from Server');
    });
  });
  server.listen(3000);
}
