import 'package:ai_app/features/translation/widgets/words_translated.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WordsAndIconAfterTranslate extends StatelessWidget {
  const WordsAndIconAfterTranslate(
      {super.key,
      required this.wordsTranslated,
      required this.copyToClipboard,
      required this.lang});
  final String wordsTranslated;
  final Function copyToClipboard;
  final String lang;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment:
            lang == 'Arabic' ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          WordsTranslated(wordsTranslated: wordsTranslated),
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: IconButton(
                onPressed: () {
                  copyToClipboard(text: wordsTranslated);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.copy,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
