import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

void itemCart() {}

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '장바구니',

        //style: TextStyle(colors.ThemeData),
      ),
    ),
    body: Column(
      children: [
        itemCartList(),
      ],
    ),
  );
}

itemCartList() {}



// final lightTheme = ThemeData(

//   useMaterial3: true,

//   scaffoldBackgroundColor: [E6ECF2],

// appBarTheme: AppBarTheme(color: 95C5D4),

// colorScheme: ColorScheme.fromSeed(seedColor: [E6ECF2],

// brightness: Brightness.light,

// surface: Colors.white,

// surfaceContainer: [95C5D4],

// onSurface: [606060],

// )

// );