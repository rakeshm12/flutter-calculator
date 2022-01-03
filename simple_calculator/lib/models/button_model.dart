import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.isEqual,
      required this.onTap,
      required this.text,
      this.buttonColor,
      this.textColor})
      : super(key: key);

  final void Function() onTap;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  bool isEqual = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: buttonColor),
          child: Text(
            text,
            style: isEqual
                ? TextStyle(
                    fontSize: 50, fontWeight: FontWeight.bold, color: textColor)
                : TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor),
          ),
        ),
      ),
    );
  }
}
