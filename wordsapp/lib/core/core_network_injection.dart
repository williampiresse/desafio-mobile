import 'package:get_it/get_it.dart';

import 'injection/dependency_injection_interface.dart';
import 'network/core_network_info.dart';

class CoreNetworkInfoInjection implements DependencyInjectionInterface {
  CoreNetworkInfoInjection(this.injector);

  final GetIt injector;
  static CoreNetworkInfoInjection? _defaultInstance;

  static CoreNetworkInfoInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = CoreNetworkInfoInjection(getIt);
  }

  @override
  Future<void> build() async {
    injector.registerSingleton<CoreNetworkInfoInterface>(CoreNetworkInfo());
  }
}
