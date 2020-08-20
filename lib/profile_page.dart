import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ScrollController _controller;
  MediaQueryData _mediaQuery;
  double _width;

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
    _width = _mediaQuery.size.width;
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
            toolbarHeight: toolbarHeight,
            expandedHeight: _width - _mediaQuery.padding.top,
            flexibleSpace: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: map(_controller.offset, 0, _width, _width, 40),
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
          ),
          SliverFillRemaining(),
        ],
      ),
    );
  }
}

double map(double x, double start1, double stop1, double start2, double stop2) {
  return (x - start1) / (stop1 - start1) * (stop2 - start2) + start2;
}
