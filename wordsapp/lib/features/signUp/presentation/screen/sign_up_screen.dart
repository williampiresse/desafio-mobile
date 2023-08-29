import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_config.dart';
import '../../../../core/utils/color.dart';
import '../../../start/screen/start_screen.dart';
import '../components/form_sign_up_widget.dart';
import '../cubit/sign_up_cubit.dart';
import '../cubit/sign_up_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        backgroundColor: AppColors.colorBackgroundFooter,
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        color: AppColors.corDoCardDosCampos,
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => CoreConfig.injector<SignUpCubit>(),
            child: BlocListener<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccess) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const StartScreen()),
                  );
                } else if (state is SignUpFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.getMessage),
                    behavior: SnackBarBehavior.floating,
                  ));
                }
              },
              child: BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 450.0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 350.0,
                                  height: 450.0,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    elevation: 8.0,
                                    color: AppColors.colorBackgroundFooter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          FormSignUpWidget(
                                            isLoading: state is SignUpLoading,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
