import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_provider.dart';
import 'package:flutter_application_1/pages/item_detail.dart';
import 'package:flutter_application_1/pages/item_detail2.dart';
import 'package:flutter_application_1/pages/item_detail2.dart';
import 'package:flutter_application_1/pages/item_register.dart';
import 'package:flutter_application_1/pages/thumbnail_touch_page.dart';
import 'package:flutter_application_1/provider/item_provider.dart';
import 'package:flutter_application_1/styles/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final testItem = context.read<ItemProvider>().items[3]; //mock item 2

    return MaterialApp(
        title: 'Shopping Mall',
        themeMode: ThemeMode.light,
        theme: lightTheme,
        // darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        // home: const ItemRegister()); // 영민 테스트용!
        // home: ItemDetail2(item: testItem)); // 소린 테스트용!
        // 초희님까지 끝나면!! 아래코드로 실행해주기!
        // home: const ItemList(),
        // routes: {
        //   '/cart': (_) => const CartPage(),
        // },
        // );

        home: ThumbnailTouchPage()); // 썸네일 터치 페이지로 시작
  }
}
