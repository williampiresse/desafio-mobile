import 'package:flutter/cupertino.dart';

class LinearGradientCustom {
  static get() {
    return const LinearGradient(
      begin: Alignment(-1.0, 0.1),
      end: Alignment(1.0, 1.1),
      colors: [
        Color(0xFF34A48E),
        Color(0xFFE8E07E),
      ],
    );
  }
}
