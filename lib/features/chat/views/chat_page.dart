import 'package:ai_app/app_security.dart';
import 'package:ai_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatView extends StatelessWidget {
  final _provider = GeminiProvider(
    model: GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: ''.apiKey,
    ),
  );

  ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        shadowColor: Colors.black,
        backgroundColor: primaryColor,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.deepPurple,
            height: 5.0,
          ),
        ),
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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Gemini ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SvgPicture.asset(
              'assets/images/gemini.svg',
              semanticsLabel: 'Dart Logo',
              width: 25,
              height: 25,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(8.0),
          child: LlmChatView(
            provider: _provider,
          ),
        ),
      ),
    );
  }
}
