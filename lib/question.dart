class Question {
  String question;
  bool answer;
  Question({this.answer, this.question});

  // Question({this.answer, this.question}); // Sozsuz emes, named parameter
  // Question({@required this.answer, @required this.question}); // Sozsuz parametler berilish kerek
  // Question(this.answer, this.question); // Paramet atini jazbay class kurasin, birok sozsuz paramet berilish kerek
  // Question([this.answer, this.question]); //  paramet berilbese da bolot
}
