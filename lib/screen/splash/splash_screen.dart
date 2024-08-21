import 'package:flutter/material.dart';
import 'dart:async';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override 
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, AppRoutes.homePath);
    });
  } 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Splash screen",
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(225, 235, 240, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/images/bmi.png',
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    'Stay Fit and Informed Every Day', 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF313851)),
                  )
                ]
            )
        )
      )
    );
  }
}