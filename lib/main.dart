import 'package:flutter/material.dart';
import 'package:profileui/profiles/profile2/profile2.dart';
import 'package:profileui/profiles/profile3/profile3.dart';
import 'package:profileui/profiles/profile4/profile4.dart';
import 'package:profileui/profiles/profile5/profile5.dart';

import 'profiles/profile1/profile_1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Comfortaa'
      ),
      home: Profile5(),
    );
  }
}