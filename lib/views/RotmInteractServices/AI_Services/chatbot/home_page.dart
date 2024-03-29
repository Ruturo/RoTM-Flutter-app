// ignore_for_file: non_constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rotm/views/RotmInteractServices/AI_Services/chatbot/feature_box.dart';
import 'package:rotm/views/RotmInteractServices/AI_Services/chatbot/openai_service.dart';
import 'package:rotm/views/RotmInteractServices/AI_Services/chatbot/pallete.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  TextEditingController UserPromptToAIModel = TextEditingController();
  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {}

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      appBar: AppBar(
        title: BounceInDown(
          child: Text(
            'RoTM',
            style: GoogleFonts.getFont(
              'Orbitron',
              fontSize: 25,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // virtual assistant picture
            ZoomIn(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Text(
                        '       VIRTUAL ASSISTANT',
                        style: GoogleFonts.getFont(
                          'Orbitron',
                          fontSize: 25,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // chat bubble
            FadeInRight(
              child: Visibility(
                visible: generatedImageUrl == null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Pallete.firstSuggestionBoxColor,
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    borderRadius: BorderRadius.circular(20).copyWith(
                      topLeft: Radius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      generatedContent == null
                          ? 'GREETINGS BRoTM USER , HOW MAY I ASSIST YOU TODAY?'
                          : generatedContent!,
                      style: GoogleFonts.getFont(
                        'Orbitron',
                        fontSize: generatedContent == null ? 25 : 15,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (generatedImageUrl != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(generatedImageUrl!),
                ),
              ),
            SlideInLeft(
              child: Visibility(
                visible: generatedContent == null && generatedImageUrl == null,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10, left: 22),
                  child: const Text(
                    '             ',
                    style: TextStyle(
                      fontFamily: 'Cera Pro',
                      color: Pallete.mainFontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // features list
            Visibility(
              visible: generatedContent == null && generatedImageUrl == null,
              child: Column(
                children: [
                  SlideInLeft(
                    delay: Duration(milliseconds: start),
                    child: const FeatureBox(
                      color: Pallete.firstSuggestionBoxColor,
                      headerText: 'Text Assistance',
                      descriptionText:
                          'A smarter way to stay organized and informed',
                    ),
                  ),
                  SlideInLeft(
                    delay: Duration(milliseconds: start + delay),
                    child: const FeatureBox(
                      color: Pallete.secondSuggestionBoxColor,
                      headerText: 'Image Assistance',
                      descriptionText:
                          'Get inspired and stay creative with your personal assistant',
                    ),
                  ),
                  SlideInLeft(
                    delay: Duration(milliseconds: start + 2 * delay),
                    child: const FeatureBox(
                      color: Pallete.thirdSuggestionBoxColor,
                      headerText: 'Voice Assistance',
                      descriptionText:
                          'Get the best of both worlds with a voice assistant',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      onTap: () async {
                        if (UserPromptToAIModel.text.isNotEmpty) {
                          // ignore: avoid_print
                          print(OpenAIService()
                              .chatGPTAPI(UserPromptToAIModel.text));
                          String result = await OpenAIService()
                              .chatGPTAPI(UserPromptToAIModel.text);
                          // ignore: avoid_print
                          print(result);
                          generatedContent = result;
                          // ignore: avoid_print
                          print(generatedContent);
                        } else {
                          // ignore: avoid_print
                          print('Empty');
                        }
                      },
                      controller: UserPromptToAIModel,
                      style: GoogleFonts.getFont(
                        'Orbitron',
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 157, 240, 230),
                        filled: true,
                        hintText: "Start Chatting",
                        suffixIcon: Icon(Icons.send),
                        prefixIcon: Icon(Icons.key),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
