import 'dart:math' show min, max;

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
  final imgSize = 40.0;

  double mapOffset(double start, double stop) {
    return map(_controller.offset, 0, _width, start, stop);
  }

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
            toolbarHeight: toolbarHeight,
            expandedHeight: _width - _mediaQuery.padding.top,
            flexibleSpace: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Stack(
                  alignment: Alignment.bottomLeft,
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      left: mapOffset(0, 60),
                      bottom: mapOffset(0, (toolbarHeight - imgSize) / 2),
                      child: Container(
                        width: mapOffset(_width, 40),
                        child: Hero(
                          tag: 'pfp',
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(mapOffset(0, 40)),
                            child: Image.network(
                              'https://picsum.photos/id/237/400/400',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: toolbarHeight,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          SizedBox(width: mapOffset(0, 50 + imgSize)),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) => ListTile(title: Text('$i')),
            ),
          )
        ],
      ),
    );
  }
}

double map(double x, double start1, double stop1, double start2, double stop2) {
  final val = (x - start1) / (stop1 - start1) * (stop2 - start2) + start2;

  if (start2 < stop2) return max(min(val, stop2), start2);
  return max(min(val, start2), stop2);
}
