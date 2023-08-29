import 'package:flutter/material.dart';

import '../utils/color.dart';
import 'linear_gradient_custom_widget.dart';

class ButtonCustomWidget extends StatefulWidget {
  const ButtonCustomWidget({
    required this.text,
    required this.onPress,
    required this.isLoading,
    required this.heightPorcente,
    required this.widthPorcente,
    this.disable = false,
    super.key,
  });

  final String text;
  final Function() onPress;
  final bool isLoading;
  final double widthPorcente;
  final double heightPorcente;
  final bool disable;

  @override
  State<ButtonCustomWidget> createState() => _ButtonCustomWidgetState();
}

class _ButtonCustomWidgetState extends State<ButtonCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (contex, constraints) {
        return Container(
          width: constraints.maxWidth * widget.widthPorcente,
          height: constraints.maxHeight * widget.heightPorcente,
          decoration: widget.disable
              ? null
              : BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  shape: BoxShape.rectangle,
                  gradient: LinearGradientCustom.get(),
                ),
          child: TextButton(
            onPressed: widget.disable ? null : widget.onPress,
            style: TextButton.styleFrom(
              backgroundColor:
                  widget.disable ? Colors.white.withOpacity(0.2) : null,
              fixedSize: const Size(100, 100),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: widget.isLoading
                ? const Padding(
                    padding: EdgeInsets.all(8),
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: AppColors.colorBackgroundFooter,
                    ),
                  )
                : Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
