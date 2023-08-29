import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:safe_device/safe_device.dart';

import '../core_config.dart';

mixin CoreNetworkInfoInterface {
  Future<bool> checkConnectivity();
}

class CoreNetworkInfo implements CoreNetworkInfoInterface {
  CoreNetworkInfo();

  final Connectivity connectionChecker = CoreConfig.injector<Connectivity>();

  @override
  Future<bool> checkConnectivity() async {
    final ConnectivityResult connection =
    await connectionChecker.checkConnectivity();

    final bool isConnected = connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi ||
        connection == ConnectivityResult.other;

    return isConnected;
  }
}