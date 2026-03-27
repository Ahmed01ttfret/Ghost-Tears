

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_game_tears/set/setbody.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.blueGrey,
      body: SetBody(),
    );
  }
}
