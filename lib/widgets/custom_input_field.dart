import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController inputController;
  final String placeholder;
  final String helperText;
  final String inputType; 
  final String suffixText;
  final String? Function(String?)? validator;

  const CustomInputField({
    required this.label,
    required this.inputController,
    this.placeholder = "Enter...",
    this.helperText = "",
    this.inputType = '',
    this.suffixText = '',
    this.validator, // Apply validation 
    super.key
  });

  TextInputType getInputFieldType(String type) {
    if (type == 'number') {
      return TextInputType.number;
    }
    return TextInputType.text;
  }

  List<TextInputFormatter> getInputFormat(String type) {
    if (type == 'number') {
      return [FilteringTextInputFormatter.digitsOnly];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      color: const Color(0xFF14193b),
      alignment: Alignment.topCenter,
      child: TextFormField(
        controller: inputController,
        // obscureText: true, // Masks the input text
        decoration: InputDecoration(
          labelText: label.toUpperCase(),
          labelStyle: const TextStyle(fontSize: 16, color: Color(0xFFB3B3B3), fontWeight: FontWeight.w600),
          hintText: placeholder,
          contentPadding: const EdgeInsets.fromLTRB(0 , 15, 0, 10),
          helperText: helperText,
          helperStyle: const TextStyle(color:  Color(0xFFB3B3B3)),
          suffixText: suffixText,
        ),
        style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
        keyboardType: getInputFieldType(inputType),
        inputFormatters: getInputFormat(inputType),
        validator: validator,
      )
    );
  }
}