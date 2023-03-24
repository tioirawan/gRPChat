import 'dart:async';

import 'package:flutter/material.dart';
import 'package:protos/protos.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Row(
        children: const [
          Expanded(child: ChatPage(name: 'John Doe')),
          Expanded(child: ChatPage(name: 'Jane Doe')),
        ],
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final String name;

  const ChatPage({
    super.key,
    this.name = 'Anonymous',
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ClientChannel _chanel = ClientChannel(
    'localhost',
    port: 8080,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  late final ChatClient _client = ChatClient(_chanel);
  late final StreamSubscription<Message> _messageSubscription;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();

    _messageSubscription =
        _client.streamMessages(StreamMessageRequest()).listen((message) {
      final currentScroll = _scrollController.position.pixels;
      final maxScroll = _scrollController.position.maxScrollExtent;

      setState(() {
        _messages.add(message);
      });

      if (currentScroll != maxScroll) return;

      // wait for the widget to be rendered
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    _focusNode.dispose();
    _textController.dispose();
    _scrollController.dispose();
    _messageSubscription.cancel();
    _chanel.shutdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.name == 'John Doe'
          ? Colors.blueGrey[900]
          : Colors.blueGrey[100],
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) => _buildChat(_messages[index]),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    focusNode: _focusNode,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChat(Message message) => Align(
        alignment: message.email == widget.name
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:
                message.email == widget.name ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: message.email == widget.name
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                message.email,
                style: TextStyle(
                  color: message.email == widget.name
                      ? Colors.white30
                      : Colors.black38,
                  fontSize: 12,
                ),
              ),
              Text(
                message.name,
                style: TextStyle(
                  color: message.email == widget.name
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      );

  void _sendMessage() async {
    await _client.sendMessage(
      MessageRequest(
        message: Message(
          email: widget.name,
          name: _textController.text,
          id: 1,
        ),
        room: Room(
          id: 1,
        ),
      ),
    );
    _textController.clear();
    _focusNode.requestFocus();
  }
}
