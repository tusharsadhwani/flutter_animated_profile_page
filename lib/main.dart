import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Animations Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromRGBO(35, 48, 64, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(color: Color.fromRGBO(35, 48, 64, 1)),
        scaffoldBackgroundColor: Color.fromRGBO(28, 36, 47, 1),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
  const ChatBubble({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage:
                NetworkImage('https://picsum.photos/id/237/200/300'),
            radius: 18,
          ),
          SizedBox(width: 8),
          Expanded(
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  'This is a test message. Tap on my profile pic!',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({
    Key key,
  }) : super(key: key);

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
