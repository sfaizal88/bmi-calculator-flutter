import 'dart:math';
import 'package:flutter/material.dart';
import '../../widgets/custom_input_field.dart';

class CalculateForm extends StatefulWidget {
  _CalculateFormState createState() => _CalculateFormState();
}

class _CalculateFormState extends State<CalculateForm> {
  final _formKey = GlobalKey<FormState>();
  final _weightTextController = TextEditingController();
  final _heightTextController = TextEditingController();
  String bmiValue = "";
  String bmiInfo = "";

  void onSubmitForm() {
    String status = '';
    double heightInMeters = int.parse(_heightTextController.text)/100;
    double heightSquard = pow(heightInMeters, 2) as double;
    var bmi = int.parse(_weightTextController.text) / heightSquard;
    if (bmi < 18.5) {
      status = "You are Underweight.";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      status = "You are Normal weight.";
    } else if (bmi >= 25 && bmi < 29.9) {
      status = "You are Overweight.";
    } else {
      status = "You are Obesity.";
    }
    setState(() {
      bmiValue = bmi.toStringAsFixed(2);
      bmiInfo = status;
    });
  }

  void resetBMIForm() {
    setState(() {
      bmiValue = '';
      bmiInfo = '';
    });
    _formKey.currentState?.reset();
    _weightTextController.clear();
    _heightTextController.clear();
  }

  @override 
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: const Color(0xFF10122f),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            if (bmiValue.trim().isNotEmpty)
              IconButton(onPressed: resetBMIForm, icon: const Icon(Icons.refresh, size: 25, color: Colors.white)),
              const Text('Your BMI is', 
              style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              Text(bmiValue, 
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
              Text(bmiInfo, 
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
            ,
            const SizedBox(height: 20),
            Image.asset(
              'lib/assets/images/bmi-logo.png',
              width: 140,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomInputField(
                    label: 'Height', 
                    inputController: _heightTextController,
                    helperText: 'Please provide height in cm.',
                    inputType: 'number',
                    suffixText: 'CM',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide height';
                      }
                      return null;
                    }
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    label: 'Weight', 
                    inputController: _weightTextController,
                    helperText: 'Please provide weight in kg.',
                    inputType: 'number',
                    suffixText: 'KG',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide weightr';
                      }
                      return null;
                    }
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
          
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  onSubmitForm();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFff0067), // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                minimumSize: Size(MediaQuery.of(context).size.width, 50), // Button size
              ),
              child: const Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        )
      )
    );
  }
}