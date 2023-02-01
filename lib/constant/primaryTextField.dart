import 'package:flutter/material.dart';

class PrimaryTextField extends StatefulWidget {
  String title;
  String subtitle;
  TextEditingController controller;
  String? Function(String?)? validator;
  PrimaryTextField({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                "${widget.title}",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              hintText: "${widget.subtitle}"),
        ),
      ],
    );
  }
}
