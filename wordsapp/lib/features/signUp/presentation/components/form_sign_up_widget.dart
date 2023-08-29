import 'package:flutter/material.dart';

import '../../../../core/app_localization_utils.dart';
import '../../../../core/core_config.dart';
import '../../../../core/shared/button_custom_widget.dart';
import '../../../../core/utils/color.dart';
import '../../../signIn/presentation/components/form_field_widget.dart';
import '../cubit/sign_up_cubit.dart';

class FormSignUpWidget extends StatelessWidget {
  FormSignUpWidget({super.key, required this.isLoading});

  final bool isLoading;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _appLocationsUtils = AppLocalizationUtils.instance;
  final _signInCubit = CoreConfig.injector<SignUpCubit>();

  _handle(BuildContext context, String name, String email, String password) {
    if (_formKey.currentState!.validate()) {
      _signInCubit.signUpUser(email: email, password: password, name: name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          FormFieldWidget(
            typeField: TypeField.text,
            controller: _nameController,
            placeholder: _appLocationsUtils.getLocalization(context).name,
            emptyFieldMessage:
                _appLocationsUtils.getLocalization(context).fillInName,
            fieldColor: AppColors.corDoCardDosCampos,
          ),
          const SizedBox(
            height: 10,
          ),
          FormFieldWidget(
            typeField: TypeField.email,
            controller: _emailController,
            placeholder: _appLocationsUtils.getLocalization(context).email,
            emptyFieldMessage:
                _appLocationsUtils.getLocalization(context).fillInPassword,
            fieldColor: AppColors.corDoCardDosCampos,
            emailValidationMessage:
                _appLocationsUtils.getLocalization(context).validEmail,
          ),
          const SizedBox(
            height: 10,
          ),
          FormFieldWidget(
            typeField: TypeField.password,
            controller: _passwordController,
            placeholder: _appLocationsUtils.getLocalization(context).password,
            emptyFieldMessage:
                _appLocationsUtils.getLocalization(context).fillInPassword,
            fieldColor: AppColors.corDoCardDosCampos,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 100,
            height: 40,
            child: ButtonCustomWidget(
              widthPorcente: 0.04,
              heightPorcente: 0.01,
              text: _appLocationsUtils.getLocalization(context).register,
              onPress: () => _handle(
                context,
                _nameController.text,
                _emailController.text,
                _passwordController.text,
              ),
              isLoading: isLoading,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
