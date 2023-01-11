import 'package:ceyehat_app/core/base/state/consumer_state_x.dart';
import 'package:ceyehat_app/core/constants/dimens.dart';
import 'package:ceyehat_app/core/constants/validators.dart';
import 'package:ceyehat_app/di/repository_impl.dart';
import 'package:ceyehat_app/presentation/components/button_x.dart';
import 'package:ceyehat_app/presentation/components/loading.dart';
import 'package:ceyehat_app/presentation/screens/auth/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _loginViewModel = ChangeNotifierProvider.autoDispose((ref) => LoginViewModel(ref.read(authRepository)));

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerStateX<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerStateX<LoginView> {
  late final viewModel = ref.read(_loginViewModel)..context = context;
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(_loginViewModel.select((value) => value.isLoading));
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
                          height: mediaQuery.size.height * .4,
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
                          validator: Validators.email(localization.emailValidationError),
                          decoration: InputDecoration(labelText: localization.email, counterText: ''),
                        ),
                        const SizedBox(height: Dimens.paddingInputBetween),
                        TextFormField(
                          controller: viewModel.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true, // This hides the password
                          maxLength: Validators.maxPasswordLength,
                          validator: Validators.password(localization.passwordValidationError),
                          decoration: InputDecoration(labelText: localization.password, counterText: ''),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    Dimens.paddingPageHorizontal,
                    Dimens.paddingPageVertical,
                    Dimens.paddingPageHorizontal,
                    Dimens.paddingPageVertical + mediaQuery.padding.bottom,
                  ),
                  child: ButtonX(
                    text: localization.login,
                    onTap: viewModel.login,
                  ),
                )
              ],
            ),
    );
  }
}
