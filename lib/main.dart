import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/item_detail.dart';
import 'package:flutter_application_1/pages/item_register.dart';
import 'package:flutter_application_1/provider/item_provider.dart';
import 'package:flutter_application_1/styles/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ItemProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final testItem = context.read<ItemProvider>().items.first; //mock item 1

    return MaterialApp(
        title: 'Shopping Mall',
        themeMode: ThemeMode.light,
        theme: lightTheme,
        // darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        // home: const ItemRegister(),
        home: ItemDetail(item: testItem));
  }
}
