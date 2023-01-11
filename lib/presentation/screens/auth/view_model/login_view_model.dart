import 'package:ceyehat_app/core/base/model/base_view_model.dart';
import 'package:ceyehat_app/core/extensions/context_extension.dart';
import 'package:ceyehat_app/domain/repositories/auth_repository.dart';
import 'package:ceyehat_app/presentation/screens/navigation/view/navigation_view.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel(this._authRepository);

  final AuthRepository _authRepository;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() async {
    if (!formKey.currentState!.validate()) return;

    final result = await _authRepository.login(emailController.text, passwordController.text);

    result.fold((l) {
      if (!mounted) return;
      context.showSnackBar(l.toLocalizedString(context));
    }, (r) {
      if (!mounted) return;
      context.push(const NavigationView());
    });
  }
}
