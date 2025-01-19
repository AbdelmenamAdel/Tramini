// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double? width;
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 150,
      height: 47,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            enableFeedback: true,
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            backgroundColor:
                const WidgetStatePropertyAll(Colors.deepPurpleAccent),
            elevation: WidgetStateProperty.all(0),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            )),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
