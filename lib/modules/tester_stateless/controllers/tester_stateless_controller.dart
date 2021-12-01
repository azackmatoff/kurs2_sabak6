import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurs2_sabak6/constants/app_colors.dart';

class TesterStatelessController extends GetxController {
  RxInt counter = 0.obs;

  RxString name = 'Pustoy'.obs;

  RxList<String> tizme = <String>[].obs;

  RxList<Icon> icons = <Icon>[].obs;

  Rx<Icon> icon = Icon(null).obs;

  void ikonkaJasa(IconData comingIcon) {
    icon.value = Icon(
      comingIcon,
      size: 50,
      color: AppColors.white,
    );

    print('icon.value: ${icon.value}');
  }

  void increment() {
    counter.value++;

    name.value = 'Koboyt';

    print('TesterStatelessController increment counter: ${counter.value}');
  }

  void decrement() {
    counter.value--;
    name.value = 'Azayt';
    print('TesterStatelessController decrement counter: ${counter.value}');
  }
}
