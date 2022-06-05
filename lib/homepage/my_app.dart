import 'package:flutter/material.dart';
import 'package:solid_software_test_task/homepage/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test task',
      home: MyHomePage(),
    );
  }
}
