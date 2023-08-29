import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_localization_utils.dart';
import '../../../../core/core_config.dart';
import '../../../../core/shared/button_custom_widget.dart';
import '../../../../core/utils/color.dart';
import '../../../signUp/presentation/screen/sign_up_screen.dart';
import '../../../start/screen/start_screen.dart';
import '../cubit/sign_in_cubit.dart';
import '../cubit/sign_in_state.dart';
import 'form_field_widget.dart';

class CardFieldWidget extends StatelessWidget {
  CardFieldWidget({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _appLocationsUtils = AppLocalizationUtils.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => CoreConfig.injector<SignInCubit>(),
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const StartScreen()),
            );
          } else if (state is SingInFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.getMessage),
              behavior: SnackBarBehavior.floating,
            ));
          }
        },
        child: BlocBuilder<SignInCubit, SignInState>(
          builder: (context, state) {
            return SizedBox(
              width: 350.0,
              height: 380.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 8.0,
                color: AppColors.corDoCardDosCampos,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        FormFieldWidget(
                          typeField: TypeField.email,
                          controller: _emailController,
                          placeholder:
                              _appLocationsUtils.getLocalization(context).email,
                          emptyFieldMessage: _appLocationsUtils
                              .getLocalization(context)
                              .fillInEmail,
                          fieldColor: AppColors.corDoCardDosCampos,
                          emailValidationMessage: _appLocationsUtils
                              .getLocalization(context)
                              .validEmail,
                        ),
                        FormFieldWidget(
                          typeField: TypeField.password,
                          controller: _passwordController,
                          placeholder: _appLocationsUtils
                              .getLocalization(context)
                              .password,
                          emptyFieldMessage: _appLocationsUtils
                              .getLocalization(context)
                              .fillInPassword,
                          fieldColor: AppColors.corDoCardDosCampos,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1,
                          height: 50,
                          child: ButtonCustomWidget(
                            widthPorcente: 0.3,
                            heightPorcente: 0.1,
                            text: _appLocationsUtils
                                .getLocalization(context)
                                .login,
                            onPress: () => _submitSignIn(context),
                            isLoading: state is SingInLoading ? true : false,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () => _signUpNewUser(context),
                          child: Text(
                            _appLocationsUtils
                                .getLocalization(context)
                                .newAroundHere,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _signUpNewUser(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SignUpScreen()),
    );
  }

  void _submitSignIn(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SignInCubit>().signInUser(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
    }
  }
}
