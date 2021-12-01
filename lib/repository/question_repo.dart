import 'package:get/get.dart';
import 'package:kurs2_sabak6/models/question_model.dart';
import 'package:kurs2_sabak6/modules/home/controllers/home_controller.dart';

class QuestionRepository {
  final HomeController _homeController = Get.find();

  int index = 0;

  List<QuestionModel> questions = [
    QuestionModel(question: 'Бактен Өзгөнгө караштуубу?', answer: false), //0
    QuestionModel(question: 'Баткен районбу?', answer: false), //1
    QuestionModel(question: 'Баткен Кыргызстандабы?', answer: true), //2
    QuestionModel(question: 'Аягына чыкты', answer: true), //3
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
    _homeController.resetIcons();
  }

  /// local, jergiluktuu
}

// global, but jerden jetkenge mumkun (dostupen)

final QuestionRepository questionBrain = QuestionRepository();
