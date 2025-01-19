import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomLangButton extends StatelessWidget {
  String lang;
  Function showBottomSheet;
  final int numButton;
  CustomLangButton(
      {super.key,
      required this.lang,
      required this.showBottomSheet,
      required this.numButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(25))),
          textStyle: WidgetStateProperty.all(const TextStyle(
              fontSize: 17.2,
              color: Colors.white,
              fontWeight: FontWeight.w500)),
          fixedSize: const WidgetStatePropertyAll(Size(140, 50)),
          enableFeedback: true,
          foregroundColor: const WidgetStatePropertyAll(Color(0xFFFFFFFF)),
          backgroundColor: const WidgetStatePropertyAll(Colors.deepPurple),
          elevation: WidgetStateProperty.all(0),
        ),
        onPressed: () {
          // showBottomSheet(numButton: numButton);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 3.0, top: 6.0, bottom: 0),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            Text(lang),
          ],
        ));
  }
}
