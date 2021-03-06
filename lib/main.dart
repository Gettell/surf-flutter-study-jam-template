import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/firebase.dart';
import 'package:surf_practice_chat_flutter/firebase_options.dart';
import 'package:surf_practice_chat_flutter/screens/chat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(
      androidKey: 'AIzaSyCXU5f25S_SUeVv7cAzoeF373kHk4Hv2dE',
      iosKey: 'enter ios key here',
      webKey: 'enter web key here',
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatRepository = ChatRepositoryFirebase(FirebaseFirestore.instance);

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          primarySwatch: Colors.deepPurple,
        ).copyWith(
          secondary: Colors.grey,
        ),
      ),
      home: ChatScreen(
        chatRepository: chatRepository,
      ),
    );
  }
}
