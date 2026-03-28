
import 'package:flutter/material.dart';

import 'body.dart';

class StartUp extends StatefulWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.redAccent,
                    Colors.red

                  ],
                  begin: Alignment.center

              )
          ),
          child: const TwoBody()),
    );
  }
}
