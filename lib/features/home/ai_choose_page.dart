import 'package:ai_app/constants.dart';
import 'package:ai_app/features/chat/views/chat_page.dart';
import 'package:ai_app/features/image/views/image_page.dart';
import 'package:ai_app/features/translation/views/translate_page.dart';
import 'package:ai_app/common/ai_type_card.dart';
import 'package:flutter/material.dart';

class AiChoosePage extends StatelessWidget {
  const AiChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.black,
        backgroundColor: primaryColor,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.deepPurple,
            height: 1.0,
          ),
        ),

        title: const Text(
          'AI Assistant',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {

        //       },
        //       icon: Icon(
        //         Icons.dark_mode_outlined,
        //         color: Colors.deepPurple,
        //       ))
        // ],
      ),
      body: Column(
        children: [
          AiTypeCard(
            imgSrc: 'assets/images/ai_hand_waving.json',
            nameAi: 'AI Chat',
            page: ChatView(),
          ),
          const AiTypeCard(
            imgSrc: 'assets/images/ai_play.json',
            nameAi: 'Generate images',
            heightImg: 100,
            widthImg: 100,
            direction: TextDirection.rtl,
            page: AiTextToImageGenerator(),
          ),
          const AiTypeCard(
            imgSrc: 'assets/images/Animation - 1715413486579.json',
            nameAi: 'Translator',
            widthImg: 160,
            heightImg: 180,
            page: TransPage(),
          ),
        ],
      ),
    );
  }
}
