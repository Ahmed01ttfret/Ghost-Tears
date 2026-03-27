import 'package:flutter/material.dart';
import 'package:ghost_game_tears/ui/index.dart';

import 'logics/database.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    Save().Put('1',true);
    return MaterialApp(
      title: 'Ghost Tears',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
