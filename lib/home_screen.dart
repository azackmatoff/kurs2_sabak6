import 'package:flutter/material.dart';
import 'package:kurs2_sabak6/question_brain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Icon> scoreKeeper = [];
  // Array, List, massiv
  //DART: List

  bool _isLast = false;

  @override
  void initState() {
    super.initState();

    // //Versiya 1, srazu ichine koshobuz
    // scoreKeeper.add(Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ));

    // //Versiya 2, icon2 dep tur jasap alip, kiyin oshonu tizmege koshobuz
    // Icon icon2 = Icon(
    //   Icons.close,
    //   color: Colors.red,
    // );

    // scoreKeeper.add(icon2);
  }

// functions

  void checkAnswer(bool answer) {
    //

    final _lastQuestion = questionBrain.isLastQuestion();

    print('_lastQuestion: $_lastQuestion');

    if (_lastQuestion) {
      setState(() {
        _isLast = true;
      });
    }

    final _finished = questionBrain.isFinished();

    if (_finished) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Finished!'),
          content: const Text('Ayagina jettin!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            )
          ],
        ),
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
        //
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        //
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      questionBrain.nextQuestion();
      setState(() {});
    }

    // print('answer: $answer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
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
                    // quizBrain.getQuestionText(),
                    // 'test',
                    // QuestionBrain().getQuestion(), //Versiya 1,
                    questionBrain.getQuestion(), //Versiya 2
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            _isLast
                ? const SizedBox.shrink()
                : Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text(
                          'Туура',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          //The user picked true.
                          checkAnswer(true);
                        },
                      ),
                    ),
                  ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  color: Colors.red,
                  child: Text(
                    _isLast ? 'Кайрадан башта' : 'Туура эмес',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    //The user picked false.
                    checkAnswer(false);
                  },
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
