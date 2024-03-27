
import 'package:flutter/material.dart';
import 'package:midjourneya/features/ui/create_prompt_screen.dart';
import 'package:midjourneya/features/ui/splash_screen.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.grey.shade900,
          elevation: 0
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900
      ),
      home: SplashScreen(),
    );
  }
}
