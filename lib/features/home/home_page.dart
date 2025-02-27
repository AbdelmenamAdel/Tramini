import 'package:ai_app/constants.dart';
import 'package:ai_app/features/home/ai_choose_page.dart';
import 'package:ai_app/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        //  Text --> Welcome
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'AI Assistant',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tremini',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // animated image
        Lottie.asset(
          'assets/images/Animation - 1715413486579.json',
          width: double.infinity,
          height: 350,
        ),
        const Spacer(),

        const Text(
          'Ask me Anything',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            textAlign: TextAlign.center,
            'I can be your Best Friend & You can ask me anything & I will help you!',
            style: TextStyle(
              letterSpacing: .5,
              height: 1.3,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ),
        const Spacer(),
        CustomButton(
          title: 'Go',
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AiChoosePage();
                },
              ),
            );
          },
        ),
        const Spacer(),
      ]),
    );
  }
}
