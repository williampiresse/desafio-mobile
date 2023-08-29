import 'package:flutter/material.dart';

import '../../../../../core/shared/button_custom_widget.dart';
import '../../../../../core/utils/color.dart';
import 'shimmer_widget.dart';

class BodySummerWidget extends StatelessWidget {
  const BodySummerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Card(
              color: AppColors.corDoCardDosCampos,
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShimmerWidget.rectagular(
                      height: 20,
                      width: 100,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ShimmerWidget.rectagular(height: 20, width: 100),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child:SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: 40,
                child: ButtonCustomWidget(
                  widthPorcente: 0.05,
                  heightPorcente: 0.02,
                  text: "Play",
                  onPress: () {},
                  isLoading: false,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Meaning",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ShimmerWidget.rectagular(height: 30),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  child: ButtonCustomWidget(
                    widthPorcente: 0.05,
                    heightPorcente: 0.01,
                    text: "Voltar",
                    onPress: () {},
                    isLoading: false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  child: ButtonCustomWidget(
                    widthPorcente: 0.05,
                    heightPorcente: 0.01,
                    text: "Próximo",
                    onPress: () {},
                    isLoading: false,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
