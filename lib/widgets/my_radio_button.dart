import 'package:flutter/material.dart';

enum AnswerType{oui, non}
class MyRadioButton extends StatelessWidget {
  MyRadioButton({super.key,
    required this.answerType,
    required this.title,
    required this.value,
    required this.onChanged
  });

  String title;
  AnswerType value;
  AnswerType? answerType;
  Function(AnswerType?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<AnswerType>(
        contentPadding: EdgeInsets.all(0.0),
        value: AnswerType.oui,
        groupValue: answerType,
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        tileColor: Colors.greenAccent,
        title: Text(AnswerType.oui.name),
        onChanged: onChanged,
      ),
    );
  }
}