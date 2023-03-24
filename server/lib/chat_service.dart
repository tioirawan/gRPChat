import 'dart:async';

import 'package:protos/protos.dart';

class ChatService extends ChatServiceBase {
  final StreamController<Message> _streamController =
      StreamController.broadcast();

  @override
  Future<Message> sendMessage(ServiceCall call, MessageRequest request) async {
    _streamController.add(request.message);

    return request.message;
  }

  @override
  Stream<Message> streamMessages(
    ServiceCall call,
    StreamMessageRequest request,
  ) async* {
    await for (final message in _streamController.stream) {
      yield message;
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }
}
