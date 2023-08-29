import 'package:flutter/material.dart';
import 'package:wordsapp/core/utils/valid_email.dart';

enum TypeField { email, password, text }

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    required this.placeholder,
    required this.emptyFieldMessage,
    required this.fieldColor,
    required this.controller,
    required this.typeField,
    this.emailValidationMessage,
    Key? key,
  }) : super(key: key);

  final String placeholder;
  final String emptyFieldMessage;
  final String? emailValidationMessage;
  final Color fieldColor;
  final TextEditingController controller;
  final TypeField typeField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              width: 1.8,
              color: Colors.white,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              width: 1.8,
              color: Color(0xFF34A48E),
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              width: 1.8,
            ),
          ),
          hintText: placeholder,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 15),
          filled: true,
          fillColor: fieldColor,
        ),
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return emptyFieldMessage;
          }
          if (typeField == TypeField.email) {
            if (!value.isValidEmail()) {
              return emailValidationMessage;
            }
          }
          return null;
        },
      ),
    );
  }
}
