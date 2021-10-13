import 'package:kurs2_sabak6/question.dart';

class QuestionBrain {
  int index = 0;

  List<Question> questions = [
    Question(question: 'Бактен Өзгөнгө караштуубу?', answer: false), //0
    Question(question: 'Баткен районбу?', answer: false), //1
    Question(question: 'Баткен Кыргызстандабы?', answer: true), //2
    Question(question: 'Аягына чыкты', answer: true), //3
    //4
  ];

  // Question q1 = Question(question: 'Batken Ozgonbu?', answer: false);
  // Question q2 = Question(question: 'Batken Rayonbu?', answer: false);
  // Question q3 = Question(question: 'Batken Kirgizstandabi?', answer: true);

  bool checkAsnwer(bool answer) {
    // jooptu tekshersin
    return answer == questions[index].answer;
  }

  bool isLastQuestion() {
    return questions[questions.length - 2].question ==
        questions[index].question;
  }

  bool isFinished() {
    //Versiya 1, uzun jolu
    // if(countFinish == 2)
    // if (index >= questions.length - 1) {

    //   return true;
    // } else {

    //   return false;
    // }

    //Versiya 2, kiska jolu
    return index >= questions.length - 1;
  }

  void nextQuestion() {
    if (index < questions.length - 1) {
      index++;
    }
  }

  String getQuestion() {
    // print('getQuestion: ${questions[index].question}');
    return questions[index].question;
  }

  void reset() {
    index = 0;
  }

  /// local, jergiluktuu
}

// global, but jerden jetkenge mumkun (dostupen)

final QuestionBrain questionBrain = QuestionBrain();
