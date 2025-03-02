import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 1.5,
          backgroundColor: Colors.greenAccent,
        ),
      ),
    );
  }
}
