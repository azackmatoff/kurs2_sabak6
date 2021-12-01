import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    @required this.onPressed,
    @required this.buttonText,
    this.buttonBgColor,
    Key key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;
  final Color buttonBgColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: FlatButton(
          textColor: Colors.white,
          color: buttonBgColor ?? Colors.green,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
