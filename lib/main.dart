import 'package:breakingbad_application/screens/breaking_bad_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/breakingbad',
      routes: {
        '/breakingbad':(context)=>const BreakingBadScreen(),
      },
    );
  }
}