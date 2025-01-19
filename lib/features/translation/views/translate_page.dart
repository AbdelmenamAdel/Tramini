import 'package:ai_app/constants.dart';
import 'package:ai_app/features/translation/widgets/custom_divider.dart';
import 'package:ai_app/features/translation/widgets/custom_input.dart';
import 'package:ai_app/features/translation/widgets/words_and_icon.dart';
import 'package:ai_app/common/custom_lang_butt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';

class TransPage extends StatefulWidget {
  const TransPage({super.key});

  @override
  State<TransPage> createState() => _TransPageState();
}

class _TransPageState extends State<TransPage> {
  TextEditingController transController = TextEditingController();
  final translator = GoogleTranslator();

  bool isVisible = false;
  String wordsTranslated = '';
  String lang1 = 'English';
  String lang2 = 'Arabic';
  final List langName = [];

  final Map<String, String> languageCodes = {
    'English': 'en',
    'Arabic': 'ar',
    'French': 'fr',
    'Spanish': 'es',
    'German': 'de',
    'Italian': 'it',
    'Portuguese': 'pt',
    'Russian': 'ru',
    'Japanese': 'ja',
    'Korean': 'ko',
    'Chinese': 'zh',
    'Hindi': 'hi',
    'Bengali': 'bn',
    'Urdu': 'ur',
    'Malay': 'ms',
    'Vietnamese': 'vi',
    'Thai': 'th',
    'Turkish': 'tr',
    'Polish': 'pl',
  };

  void getKeyFromMap() {
    for (String key in languageCodes.keys) {
      langName.add(key);
    }
  }

  void showBottomSheet({required int numButton}) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        getKeyFromMap();
        return Container(
          height: 500,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: langName.length,
            itemBuilder: (context, index) {
              return TextButton(
                  onPressed: () {
                    if (numButton == 1) {
                      lang1 = langName[index];
                    } else {
                      lang2 = langName[index];
                    }
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Text(langName[index]));
            },
          ),
        );
      },
    );
  }

  Future<void> copyToClipboard({required text}) async {
    // Create a ClipboardData object with the text you want to copy
    ClipboardData data = ClipboardData(text: text);
    // Copy the data to the clipboard
    await Clipboard.setData(data);
  }

  Future<void> translateFromTo(
      {required String input,
      required String lnFrom,
      required String lnTo}) async {
    await translator
        .translate(input, from: lnFrom, to: lnTo)
        .then((value) => wordsTranslated = value.toString());
    setState(() {});
  }

  void translateTextField(String value) {
    if (value != '') {
      translateFromTo(
          input: transController.text,
          lnFrom: languageCodes[lang1]!,
          lnTo: languageCodes[lang2]!);
      isVisible = true;
      setState(() {});
    } else {
      isVisible = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.deepPurple,
            height: 1.0,
          ),
        ),
        shadowColor: Colors.black,
        backgroundColor: primaryColor,
        // bottom: const PreferredSize(
        //   preferredSize: Size.fromHeight(1.0),
        //   child: Divider(
        //     color: Colors.deepPurple,
        //     height: 1.0,
        //   ),
        // ),
        leading: IconButton(
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.deepPurpleAccent,
          ),
        ),

        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Translate ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.translate,
              color: Colors.blueGrey,
              size: 24,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // text field
          Column(
            children: [
              CustomTextFieldForTranslate(
                transController: transController,
                lang1: lang1,
                translateTextField: translateTextField,
              ),
              Visibility(
                visible: isVisible,
                child: Column(
                  children: [
                    const CustomDivider(),
                    WordsAndIconAfterTranslate(
                      copyToClipboard: copyToClipboard,
                      lang: lang1,
                      wordsTranslated: wordsTranslated,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomLangButton(
                numButton: 1,
                lang: lang1,
                showBottomSheet: showBottomSheet,
              ),
              IconButton(
                onPressed: () {
                  String temp = lang1;
                  lang1 = lang2;
                  lang2 = temp;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.swap_horizontal_circle_sharp,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              CustomLangButton(
                numButton: 2,
                lang: lang2,
                showBottomSheet: showBottomSheet,
              ),
            ],
          ),
          const SizedBox(height: 12)
        ],
      ),
    );
  }
}
