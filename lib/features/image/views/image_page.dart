import 'package:ai_app/constants.dart';
import 'package:ai_app/common/custom_button.dart';
import 'package:ai_app/features/image/api/image_api.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart';

class AiTextToImageGenerator extends StatefulWidget {
  const AiTextToImageGenerator({super.key});
  @override
  State<AiTextToImageGenerator> createState() => _AiTextToImageGeneratorState();
}

class _AiTextToImageGeneratorState extends State<AiTextToImageGenerator> {
  // Controller for the input field
  final TextEditingController _queryController = TextEditingController();
  // Flag to check if images have been generated
  bool isItems = false;

  // Function to generate an image based on the input query
  // Future<Uint8List> _generate(String query) async {
  //   Uint8List image = await _ai.generateImage(
  //     apiKey: ''.imageApiKey, // API key
  //     imageAIStyle: imageAIStyle, // Style for the image
  //     prompt: query, // The text prompt input by the user
  //   );
  //   return image; // Return the generated image as bytes
  // }

  // Dispose method to clean up the controller when the widget is removed from the tree
  @override
  void dispose() {
    _queryController.dispose(); // Dispose of the controller
    super.dispose(); // Call the super class dispose method
  }

  @override
  Widget build(BuildContext context) {
    // Build the UI of the widget
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
        title: const Text(
          'Image Genetation ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Text to Image",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: isItems // Check if images have been generated
                  ? FutureBuilder<Uint8List>(
                      future: ImageApi().generateImage(
                          imageName: _queryController
                              .text), // Call the generate function
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Show loading indicator while waiting for the image
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        } else if (snapshot.hasData) {
                          // If data is received, display the generated image
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(snapshot
                                .data!), // Display the image from memory
                          );
                        } else {
                          return const Text(
                              'fffffffs'); // Return an empty container if no data
                        }
                      },
                    )
                  : const Center(
                      child: Text(
                        'No any image generated yet', // Message if no images generated
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 55,
              // margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: TextField(
                controller:
                    _queryController, // Link the text field to the controller
                decoration: const InputDecoration(
                  hintText: 'Enter your prompt',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15, top: 5),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  title: 'Generate Image',
                  width: 200,
                  onPressed: () {
                    String query = _queryController.text; // Get the input text
                    if (query.isNotEmpty) {
                      setState(() {
                        isItems =
                            true; // Set the flag to indicate images are being generated
                      });
                    } else {
                      // Log a message if the query is empty
                      if (kDebugMode) {
                        print('Query is empty !!');
                      }
                    }
                  },
                ),
                AnimatedContainer(
                  margin: const EdgeInsets.only(top: 15),
                  height: 150,
                  duration: const Duration(seconds: 1),
                  child: Lottie.asset('assets/images/ai_play.json',
                      width: 120, height: 120),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
