import 'package:flutter/material.dart';
import 'package:flutter_chat_profile/profile_page.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Animations Demo'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ChatBubble(),
            ),
          ),
          MessageBox(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProfilePage(),
              ),
            ),
            child: Hero(
              tag: 'pfp',
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/id/237/400/400'),
                radius: 18,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.7,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(2),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'This is a test message. Tap on my profile pic!',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 8,
                    child: Text(
                      '13:57',
                      style: TextStyle(
                        color: Colors.blueGrey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            Icons.filter,
            color: Colors.blueGrey.shade300,
          ),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration.collapsed(
                hintText: 'Message',
              ),
            ),
          ),
          Icon(
            Icons.attach_file,
            color: Colors.blueGrey.shade300,
          ),
        ],
      ),
    );
  }
}
