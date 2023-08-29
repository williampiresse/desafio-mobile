import 'package:flutter/material.dart';

import '../../../../../core/utils/color.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.word,
    required this.pronunciation,
    super.key,
  });

  final String word;
  final String? pronunciation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.corDoCardDosCampos,
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              word,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              pronunciation ?? "",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
