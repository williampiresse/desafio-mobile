import 'package:flutter/material.dart';

import '../../../../../core/shared/button_custom_widget.dart';
import '../../../../core/app_localization_utils.dart';
import '../../../home/data/models/word_model.dart';
import 'card_widget.dart';

class WordBodyWidget extends StatefulWidget {
  const WordBodyWidget({
    required this.data,
    required this.buttonNextCallback,
    required this.buttonBackCallback,
    required this.buttonPlayCallback,
    this.disableButtonNext = false,
    this.disableButtonBack = false,
    super.key,
  });

  final WordModel data;
  final Function() buttonNextCallback;
  final Function() buttonBackCallback;
  final Function() buttonPlayCallback;
  final bool disableButtonNext;
  final bool disableButtonBack;

  @override
  State<WordBodyWidget> createState() => _WordBodyWidgetState();
}

class _WordBodyWidgetState extends State<WordBodyWidget> {
  final _appLocationsUtils = AppLocalizationUtils.instance;

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
            CardWidget(
              word: widget.data.word,
              pronunciation: widget.data.pronunciation,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: 40,
                child: ButtonCustomWidget(
                  widthPorcente: 0.05,
                  heightPorcente: 0.02,
                  text: _appLocationsUtils.getLocalization(context).play,
                  onPress: widget.buttonPlayCallback,
                  isLoading: false,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _appLocationsUtils.getLocalization(context).meaning,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "${widget.data.word} ${widget.data.meaning!}",
                    style: const TextStyle(color: Colors.white),
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
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
                    text: _appLocationsUtils.getLocalization(context).back,
                    onPress: widget.buttonBackCallback,
                    isLoading: false,
                    disable: widget.disableButtonBack,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  child: ButtonCustomWidget(
                    widthPorcente: 0.05,
                    heightPorcente: 0.02,
                    disable: widget.disableButtonNext,
                    text: _appLocationsUtils.getLocalization(context).next,
                    onPress: widget.buttonNextCallback,
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
