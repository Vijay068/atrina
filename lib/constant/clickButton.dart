import 'package:flutter/material.dart';

class clickButton extends StatelessWidget {
  String? title;
  Color? color;
  VoidCallback? onPressed;

  clickButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title ?? "",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
