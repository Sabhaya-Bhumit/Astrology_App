import 'package:astology_app/view/screens/allDetailPage.dart';
import 'package:astology_app/view/screens/detailPage.dart';
import 'package:astology_app/view/screens/homePage.dart';
import 'package:astology_app/view/screens/mainPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.black, secondary: Color(0xffFFD9D9))),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => homePage(),
        'detailPage': (context) => detailPage(),
        'mainPage': (context) => mainPage(),
        'allDetalPage': (context) =>
            allDetalPage(image: "null", index: 0, name: '0'),
      },
    ),
  );
}
