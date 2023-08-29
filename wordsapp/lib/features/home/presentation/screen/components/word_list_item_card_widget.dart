import 'package:flutter/material.dart';

import '../../../../../core/utils/color.dart';

class WordListItemCardWidget extends StatelessWidget {
  const WordListItemCardWidget({
    required this.text,
    required this.onTap,
    required this.isFavorite,
    required this.buttonFavoriteCallback,
    super.key,
  });

  final String text;
  final bool isFavorite;
  final GestureTapCallback? onTap;
  final Function() buttonFavoriteCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: 24,
                    onPressed: buttonFavoriteCallback,
                    icon: _getIconIsFavorite(),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getIconIsFavorite() {
    return Icon(
      Icons.favorite,
      color: isFavorite ? Colors.greenAccent : AppColors.colorBackgroundFooter,
    );
  }
}
