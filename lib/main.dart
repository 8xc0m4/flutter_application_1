import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/item_register.dart';
import 'package:flutter_application_1/styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Mall',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const ItemRegister(),
    );
  }
}
