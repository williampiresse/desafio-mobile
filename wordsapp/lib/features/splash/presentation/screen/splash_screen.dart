import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_localization_utils.dart';
import '../../../../core/core_config.dart';
import '../../../../core/shared/linear_gradient_custom_widget.dart';
import '../../../signIn/presentation/screen/sign_in_screen.dart';
import '../../../start/screen/start_screen.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _appLocationsUtils = AppLocalizationUtils.instance;
  final _splashCubit = CoreConfig.injector<SplashCubit>();

  @override
  void initState() {
    _splashCubit.checkAuthUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SplashCubit>(
        create: (context) => _splashCubit,
        child: BlocListener<SplashCubit, SplashState>(
          listener: (_, state) {
            if (state is SplashSuccess) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const StartScreen()),
              );
            } else if (state is SplashFailed) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const SignInScreen()),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradientCustom.get(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _appLocationsUtils.getLocalization(context).app,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
