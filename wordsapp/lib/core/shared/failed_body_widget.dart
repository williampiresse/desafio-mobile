import 'package:flutter/material.dart';

import '../app_localization_utils.dart';

class FailedBodyWidget extends StatelessWidget {
  FailedBodyWidget({super.key});

  final _appLocationsUtils = AppLocalizationUtils.instance;

  @override
  Widget build(BuildContext context) {
    return Text(
      _appLocationsUtils.getLocalization(context).failedRequestData,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );
  }
}
