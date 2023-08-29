import 'package:get_it/get_it.dart';

import 'injection/dependency_injection_impl.dart';

class CoreConfig {
  CoreConfig._internal();

  static final CoreConfig _singleton =
  CoreConfig._internal();

  static CoreConfig get instance => _singleton;

  static GetIt injector = DependencyInjection.instance.injector;

}