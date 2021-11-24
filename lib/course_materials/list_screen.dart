import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Icon> scoreKeeper = [];

  List<bool> list = [];
  // Array, List, massiv
  //DART: List

  List<String> adamdar1 = [
    'A',
    'B',
    'C',
  ];
  List<String> adamdar2 = [
    'D',
    'E',
    'F',
  ];

  List<int> baalar = <int>[];

  @override
  void initState() {
    super.initState();

    // String name;
    // int no;

    // name = no;

    Person person = Person(
      name: 'Jon',
      phoneNo: 13120000000,
    );

    // person.name

    Student student = Student();

    person = student;

    Director director = Director();

    person = director;

    //  student.name

    print('adamdar1 bashinda: $adamdar1');
    adamdar1 = adamdar2;

    // adamdar1.addAll(adamdar2);

    print('adamdar1 ayaginda: $adamdar1');
  }

  List<Container> contaier = <Container>[];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Column(
        children: scoreKeeper,
      ),
    );
  }
}

class Person {
  String name;
  int phoneNo;

  Person({this.name, this.phoneNo});
}

class Student extends Person {
  int grade;
  int studentNo;

  Student({this.grade, this.studentNo});
}

class Teacher extends Person {
  int teacherNo;
  Teacher({this.teacherNo});
}

class Director extends Teacher {}
