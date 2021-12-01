import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurs2_sabak6/constants/app_colors.dart';
import 'package:kurs2_sabak6/constants/app_text_styles.dart';
import 'package:kurs2_sabak6/modules/home/controllers/home_controller.dart';
import 'package:kurs2_sabak6/repository/question_repo.dart';
import 'package:kurs2_sabak6/widgets/custom_button.dart';
import 'package:kurs2_sabak6/widgets/custom_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.put(HomeController());

  List<Icon> scoreKeeper = [];

  bool _isLast = false;

  @override
  void initState() {
    super.initState();
  }

  void checkAnswer(bool answer) {
    final _lastQuestion = questionBrain.isLastQuestion();

    print('_lastQuestion: $_lastQuestion');

    if (_lastQuestion) {
      setState(() {
        _isLast = true;
      });
    }

    final _finished = questionBrain.isFinished();

    if (_finished) {
      CustomDialog.showCustomDialog(
        parentContext: context,
        title: 'Аягына чыкты',
        content: Text('Жаңыдан башта!'),
      );

      questionBrain.reset();

      //Versiya 1,
      //   setState(() {
      //    scoreKeeper = [];
      // });

      //Versiya 2,
      scoreKeeper = [];
      setState(() {
        _isLast = false;
      });
    } else {
      final _result = questionBrain.checkAsnwer(answer);

      // TRUE: kiska jolu: _result
      // uzun jolu: _result == true
      // FALSE:  kiska jolu: !_result
      // uzun joldoru: _result == false, je bolboso _result != true

      if (_result) {
        _homeController.addCorrectIcon();
        //
        // scoreKeeper.add(Icon(
        //   Icons.check,
        //   color: Colors.green,
        // ));
      } else {
        _homeController.addInCorrectIcon();
        //
        // scoreKeeper.add(Icon(
        //   Icons.close,
        //   color: Colors.red,
        // ));
      }
      questionBrain.nextQuestion();
      setState(() {});
    }
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
                  child: Text(
                    // QuestionBrain().getQuestion(), //Versiya 1,
                    questionBrain.getQuestion(), //Versiya 2
                    textAlign: TextAlign.center,
                    style: AppTextStyles.mainQuestionStyle,
                  ),
                ),
              ),
            ),
            _isLast
                ? const SizedBox.shrink()
                : CustomButton(
                    onPressed: () => checkAnswer(true),
                    buttonText: 'Туура',
                  ),
            CustomButton(
              onPressed: () => checkAnswer(false),
              buttonText: _isLast ? 'Кайрадан башта' : 'Туура эмес',
              buttonBgColor: Colors.red,
            ),
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
