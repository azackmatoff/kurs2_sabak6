import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kurs2_sabak6/constants/app_text_styles.dart';

class TesterStatefulScreen extends StatefulWidget {
  TesterStatefulScreen({Key key}) : super(key: key);

  @override
  _TesterStatefulScreenState createState() => _TesterStatefulScreenState();
}

class _TesterStatefulScreenState extends State<TesterStatefulScreen> {
  int _counter = 0;
  int _countBuild = 0;

  @override
  Widget build(BuildContext context) {
    _countBuild++;
    log('TesterStatefulScreen => build: $_countBuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _counter.toString(),
              style: AppTextStyles.blackText42Bold,
            ),
            const SizedBox(height: 45.0),
            TextButton.icon(
              onPressed: increment,
              icon: Icon(Icons.add),
              label: Text('increment'),
            ),
            TextButton.icon(
              onPressed: decrement,
              icon: Icon(Icons.delete),
              label: Text('decrement'),
            ),
          ],
        ),
      ),
    );
  }

  void increment() {
    setState(() {
      _counter++;
    });

    print('increment: $_counter');
  }

  void decrement() {
    _counter--;
    setState(() {});
    print('decrement: $_counter');
  }
}
