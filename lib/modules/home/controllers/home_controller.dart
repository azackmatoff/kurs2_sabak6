import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Icon> icons = <Icon>[].obs;

  @override
  void onInit() {
    super.onInit();
    //
  }

  // Tuura ikonka kosh
  void addCorrectIcon() {
    icons.add(Icon(
      Icons.check,
      color: Colors.green,
    ));
  }

  // Tuura emes ikonka kosh
  void addInCorrectIcon() {
    icons.add(Icon(
      Icons.close,
      color: Colors.red,
    ));
  }

  void resetIcons() {
    icons.value = <Icon>[];
  }
}
