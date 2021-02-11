import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'Chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class _ChatScreenState extends State<ChatScreen> {
  final textMessageController = TextEditingController();
  String messageText;
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textMessageController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      textMessageController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  bool isUser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        List<MessageBubbles> listMessageBubbles = [];
        if (!snapshot.hasData) {
          return CircularProgressIndicator(
            backgroundColor: Colors.amber,
          );
        }
        final messages = snapshot.data.docs;
        for (var message in messages) {
          final messageData = message.data();
          final messageText = messageData['text'];
          final messageSender = messageData['sender'];

          final messageBubbles = MessageBubbles(
            messageSender: messageSender,
            messageText: messageText,
            isUser: messageSender == loggedInUser.email,
          );
          listMessageBubbles.add(messageBubbles);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: listMessageBubbles,
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class MessageBubbles extends StatelessWidget {
  MessageBubbles({
    Key key,
    @required this.messageSender,
    @required this.messageText,
    @required this.isUser,
  }) : super(key: key);

  final String messageSender;
  final String messageText;
  final bool isUser;
  BorderRadius border;
  Color textColor;
  CrossAxisAlignment cross;

  @override
  Widget build(BuildContext context) {
    if (isUser) {
      border = BorderRadius.only(
          bottomLeft: Radius.circular(30),
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(30));
      textColor = Colors.cyan[400];
      cross = CrossAxisAlignment.end;
    } else {
      border = BorderRadius.only(
          bottomLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30));
      textColor = Colors.deepOrange;
      cross = CrossAxisAlignment.start;
    }
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: cross,
        children: [
          Text(
            messageSender,
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          Material(
            elevation: 6,
            borderRadius: border,
            color: textColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                messageText,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
