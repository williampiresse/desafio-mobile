import 'package:flutter/material.dart';

import '../../../../core/shared/linear_gradient_custom_widget.dart';
import '../components/card_field_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradientCustom.get(),
        ),
        child: SingleChildScrollView(
          child: CardFieldWidget(),
        ),
      ),
    );
  }
}
