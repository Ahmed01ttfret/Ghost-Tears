

import 'package:flutter/material.dart';

import 'Actions.dart';

class SelectLevelBody extends StatefulWidget {
  const SelectLevelBody({Key? key}) : super(key: key);

  @override
  _SelectLevelBodyState createState() => _SelectLevelBodyState();
}

class _SelectLevelBodyState extends State<SelectLevelBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5,10, 5, 5),
      child: Column(
        children: const [
          TopActions(),
          DropDownSelect(),
          Levels()
        ],
      ),
    );
  }
}
