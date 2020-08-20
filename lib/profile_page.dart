import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ScrollController _controller;
  MediaQueryData _mediaQuery;

  final toolbarHeight = 56.0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      print(_controller.offset);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mediaQuery = MediaQuery.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            toolbarHeight: toolbarHeight,
            expandedHeight: _mediaQuery.size.width - _mediaQuery.padding.top,
            flexibleSpace: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    child: Hero(
                      tag: 'pfp',
                      child: Image.network(
                        'https://picsum.photos/id/237/400/400',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: toolbarHeight,
                    child: Row(
                      children: [
                        SizedBox(width: 70),
                        SizedBox(width: 40),
                        SizedBox(width: 10),
                        Text(
                          'Doggo',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(),
        ],
      ),
    );
  }
}
