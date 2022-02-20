import 'package:flutter/material.dart';

import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';

/// Chat screen templete. This is your starting point.
class ChatScreen extends StatefulWidget {
  final ChatRepository chatRepository;

  const ChatScreen({
    Key? key,
    required this.chatRepository,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final myNickController = TextEditingController();
  final myMessageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myNickController.addListener(_printLatestValue);
  }

  @override
  void initStateMessage () {
    super.initState();
    myMessageController.addListener(_printLatestValueMessage);
  }

  @override
  void dispose() {
    myNickController.dispose();
    super.dispose();
  }

  @override
  void disposMessagee() {
    myMessageController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myNickController.text}');
  }

  void _printLatestValueMessage() {
    print('Second text field: ${myMessageController.text}');
  }

  @override
  Widget build(BuildContext context) {
    // TODO(task): Use ChatRepository to implement the chat.
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: myNickController,
          decoration: InputDecoration(
            hintText: 'Введите никнейм', hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: [IconButton(onPressed: () {
          setState(() {

          });
        }, icon: Icon (Icons.refresh)),],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.deepPurple,
            child: TextField (controller: myMessageController,
              decoration: InputDecoration(
                hintText: 'Введите сообщение', hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(Icons.send, color: Colors.white,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
