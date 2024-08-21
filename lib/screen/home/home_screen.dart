import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import './calculate_form.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var gender = '';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Home screen',
      home: Scaffold(
        appBar: const CustomAppBar(title: 'BMI CALCULATOR'),
        body: CalculateForm()
      )
    );
  }
}