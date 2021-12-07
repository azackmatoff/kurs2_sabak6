import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurs2_sabak6/constants/app_colors.dart';
import 'package:kurs2_sabak6/constants/app_text_styles.dart';
import 'package:kurs2_sabak6/modules/home/controllers/home_controller.dart';

import 'package:kurs2_sabak6/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = HomeController.findHomeCont;

  @override
  void initState() {
    super.initState();
    _homeController.getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Obx(
                    () => Text(
                      _homeController.question.value,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.mainQuestionStyle,
                    ),
                  ),
                ),
              ),
            ),
            Obx(() {
              return _homeController.isLast.value
                  ? const SizedBox.shrink()
                  : CustomButton(
                      onPressed: () =>
                          _homeController.checkAnswer(true, context),
                      buttonText: 'Туура',
                    );
            }),
            Obx(() => CustomButton(
                  onPressed: () => _homeController.checkAnswer(false, context),
                  buttonText: _homeController.isLast.value
                      ? 'Кайрадан башта'
                      : 'Туура эмес',
                  buttonBgColor: Colors.red,
                )),
            Obx(
              () => Row(
                children: _homeController.icons,
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
