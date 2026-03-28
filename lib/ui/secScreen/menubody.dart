


import 'package:flutter/material.dart';

import '../txt.dart';
import 'Down.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({Key? key}) : super(key: key);

  @override
  _MenuBodyState createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
      child: Column(
        children: [
          Center(child: customs('Game menu ')),
          const Adds(),
          const Expanded(child: Options()),

        ],
      ),
    );
  }
}
