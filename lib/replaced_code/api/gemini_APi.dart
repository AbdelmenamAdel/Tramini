// import 'package:google_generative_ai/google_generative_ai.dart';

// class GeminiApi {
//   String apiKey = const String.fromEnvironment('API_KEY',
//       defaultValue: 'Damn you Bitch');

// // ====  ====  ====  ====  ====   ====  ====  ====  ====  ====

//   Future<String> getTextFromAi({required String q}) async {
//     GenerativeModel model =
//         GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
//     // requiest
//     final content = [Content.text(q)];

//     // response
//     final response = await model.generateContent(content);
//     return response.text!;
//   }
// }