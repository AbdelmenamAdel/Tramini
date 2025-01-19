import 'package:flutter/material.dart';

class WordsTranslated extends StatelessWidget {
  const WordsTranslated({
    super.key,
    required this.wordsTranslated,
  });

  final String wordsTranslated;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        wordsTranslated,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
