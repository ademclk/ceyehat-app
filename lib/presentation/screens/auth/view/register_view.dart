import 'package:ceyehat_app/core/base/state/consumer_state_x.dart';
import 'package:ceyehat_app/core/constants/dimens.dart';
import 'package:ceyehat_app/core/constants/validators.dart';
import 'package:ceyehat_app/di/repository_impl.dart';
import 'package:ceyehat_app/presentation/components/button_x.dart';
import 'package:ceyehat_app/presentation/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/register_view_model.dart';

final _registerViewModel = ChangeNotifierProvider.autoDispose(
    (ref) => RegisterViewModel(ref.read(authRepository)));

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  ConsumerStateX<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerStateX<RegisterView> {
  late final viewModel = ref.read(_registerViewModel)..context = context;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(_registerViewModel.select((value) => value.isLoading));
    return Scaffold(
      appBar: isLoading
          ? null
          : AppBar(
              title: Text(localization.welcome),
            ),
      body: isLoading
          ? const Loading()
          : Column(
              children: [
                Expanded(
                  child: Form(
                    key: viewModel.formKey,
                    child: ListView(
                      padding: const EdgeInsets.only(
                          left: Dimens.paddingPageHorizontal,
                          right: Dimens.paddingPageHorizontal,
                          top: Dimens.paddingPageVertical,
                          bottom: Dimens.paddingPageVertical),
                      children: [
                        SizedBox(
                          height: mediaQuery.size.height * .2,
                          child: Icon(
                            Icons.lock_outline_rounded,
                            size: mediaQuery.size.height * .15,
                          ),
                        ),
                        TextFormField(
                          controller: viewModel.emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          maxLength: Validators.maxEmailLength,
                          validator: Validators.email(
                              localization.emailValidationError),
                          decoration: InputDecoration(
                              labelText: localization.email, counterText: ''),
                        ),
                        const SizedBox(height: Dimens.paddingInputBetween),
                        TextFormField(
                          controller: viewModel.firstNameController,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              labelText: localization.firstName,
                              counterText: ''),
                        ),
                        const SizedBox(height: Dimens.paddingInputBetween),
                        TextFormField(
                          controller: viewModel.lastNameController,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              labelText: localization.lastName,
                              counterText: ''),
                        ),
                        const SizedBox(height: Dimens.paddingInputBetween),
                        TextFormField(
                          controller: viewModel.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          maxLength: Validators.maxPasswordLength,
                          obscureText: true,
                          validator: Validators.password(
                              localization.passwordValidationError),
                          decoration: InputDecoration(
                              labelText: localization.password,
                              counterText: ''),
                        ),
                        const SizedBox(height: Dimens.paddingInputBetween),
                        TextFormField(
                          controller: viewModel.confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          maxLength: Validators.maxPasswordLength,
                          obscureText: true,
                          validator: Validators.password(
                              localization.passwordValidationError),
                          decoration: InputDecoration(
                              labelText: localization.confirmPassword,
                              counterText: ''),
                        ),
                        const SizedBox(height: Dimens.paddingInputBetween),
                        ButtonX(
                          onTap: viewModel.register,
                          text: localization.register,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
