


import 'package:flutter/material.dart';

import 'bodylevel.dart';

class SelectLevel extends StatefulWidget {
  const SelectLevel({Key? key}) : super(key: key);

  @override
  _SelectLevelState createState() => _SelectLevelState();
}

class _SelectLevelState extends State<SelectLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xfffe4a49),
                    Colors.pink,

                  ],
                  begin: Alignment.topRight,

              )
          ),
          child: const SelectLevelBody()),
    );
  }
}
