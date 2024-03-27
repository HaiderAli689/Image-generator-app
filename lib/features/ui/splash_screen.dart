import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:midjourneya/features/ui/create_prompt_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lotties/loadanime.json',
                        height: 400, repeat: true),
                    RichText(
                      text: TextSpan(
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 24,
                          ),
                          children: [
                            TextSpan(
                                text: 'Begin your journey',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600)),
                            TextSpan(
                              text: ' of exploration and discovery the',
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: ' Text to Images.',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(
                            horizontal: 150, vertical: 12)),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreatePromptScreen(),
                        ),
                      );
                    },
                    child: const Text('Continue',style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),)),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
