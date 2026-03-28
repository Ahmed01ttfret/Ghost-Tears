
import 'package:flutter/material.dart';
import 'package:ghost_game_tears/ui/txt.dart';

import 'but.dart';

class Value extends StatefulWidget {
  const Value({Key? key}) : super(key: key);

  @override
  _ValueState createState() => _ValueState();
}

class _ValueState extends State<Value> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Aku_n(),
          SizedBox(width: 30,),
          You_n(),
        ],
      ),
    );
  }
}


class Aku_n extends StatefulWidget {
  const Aku_n({Key? key}) : super(key: key);

  @override
  _Aku_nState createState() => _Aku_nState();
}

class _Aku_nState extends State<Aku_n> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: aku_,
    builder: (BuildContext context, int countvalue, child) {
      return customs('Aku: $countvalue');
    });
  }
}


class You_n extends StatefulWidget {
  const You_n({Key? key}) : super(key: key);

  @override
  _You_nState createState() => _You_nState();
}

class _You_nState extends State<You_n> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: you_,
    builder: (BuildContext context, int countvalue, child) {
      return customs('You:  $countvalue');
    });
  }
}

class Hmm extends StatefulWidget {
  const Hmm({Key? key}) : super(key: key);

  @override
  _HmmState createState() => _HmmState();
}

class _HmmState extends State<Hmm> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: custom('↫')),
        const Value()
      ],
    );
  }
}
