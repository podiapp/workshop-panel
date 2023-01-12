import 'package:ds_podi/ds_podi.dart';
import 'package:flutter/material.dart';
import 'modules/home/ui/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop',
      theme: podiThemeData(context),
      home: const MyHomePage(title: 'Meu site'),
    );
  }
}
