import 'package:protos/protos.dart';
import 'package:server/chat_service.dart';

Future<void> main(List<String> arguments) async {
  final server = Server([ChatService()]);

  await server.serve(port: 8080);
  print('Server listening on port ${server.port}...');
}
