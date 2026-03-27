

import 'package:flutter/material.dart';

import 'BodyLevel.dart';

class TwoplaerScreen extends StatefulWidget {
  const TwoplaerScreen({Key? key}) : super(key: key);

  @override
  _TwoplaerScreenState createState() => _TwoplaerScreenState();
}

class _TwoplaerScreenState extends State<TwoplaerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.redAccent,
      body: BodyLevel(),
    );
  }
}
