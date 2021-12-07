import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurs2_sabak6/modules/home/controllers/home_controller.dart';
import 'package:kurs2_sabak6/modules/home/screens/home_screen.dart';
import 'package:kurs2_sabak6/modules/tester_stateful/screens/tester_stateful_screen.dart';

import 'modules/tester_stateless/screens/tester_stateless_screen.dart';

void main() {
  Get.lazyPut<HomeController>(() => HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kurs2 Sabak6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
