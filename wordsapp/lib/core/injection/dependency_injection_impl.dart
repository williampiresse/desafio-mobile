import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/detailWord/detail_word_injection.dart';
import '../../features/favorites/favorites_injection.dart';
import '../../features/historic/historic_injection.dart';
import '../../features/home/home_injection.dart';
import '../../features/signIn/signIn_injection.dart';
import '../../features/signUp/sign_up_injection.dart';
import '../../features/splash/splash_injection.dart';
import '../api/client_authorization.dart';
import '../api/header_config_impl.dart';
import '../api/header_config_interface.dart';
import '../api/http_client.dart';
import '../core_network_injection.dart';
import '../data/preferences/shared_preferences_impl.dart';
import '../data/preferences/shared_preferences_interface.dart';
import '../data/session/session_manager_impl.dart';
import '../data/session/session_manager_interface.dart';
import '../voice/flutte_tts_impl.dart';
import '../voice/flutter_tts_interface.dart';

class DependencyInjection {
  DependencyInjection._internal();

  static final DependencyInjection _singleton = DependencyInjection._internal();

  static DependencyInjection get instance => _singleton;

  final GetIt injector = GetIt.instance;

  Future<void> initialize() async {
    final preferences = await SharedPreferences.getInstance();
    injector.registerSingleton(preferences);

    injector.registerLazySingleton<Connectivity>(() => Connectivity());



    injector.registerLazySingleton<HeaderConfigInterface>(
        () => HeaderConfigImpl.instance);

    injector.registerLazySingleton<HttpClient>(() => HttpClient.instance);

    injector.registerLazySingleton<FlutterTtsInterface>(
      () => FlutterTtsImpl.instance,
    );

    injector.registerSingleton<SharedPreferencesInterface>(
      SharedPreferencesImpl(),
    );

    injector.registerSingleton<SessionManagerInterface>(
      SessionManagerImpl(),
    );

    injector.registerLazySingleton<ClientAuthorization>(
          () => ClientAuthorization(),
    );

    await CoreNetworkInfoInjection.getInstance(injector).build();

    await SplashInjection.getInstance(injector).build();

    await SignInInjection.getInstance(injector).build();

    await SignUpInjection.getInstance(injector).build();

    await HomeInjection.getInstance(injector).build();

    await HistoricInjection.getInstance(injector).build();

    await FavoritesInjection.getInstance(injector).build();

    await DetailWordjection.getInstance(injector).build();
  }
}
