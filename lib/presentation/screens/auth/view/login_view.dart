import 'package:ceyehat_app/core/extensions/context_extension.dart';
import 'package:ceyehat_app/presentation/screens/home/view/home_view.dart';
import 'package:ceyehat_app/presentation/screens/navigation/view/navigation_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hoş geldiniz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: "Şifre",
              ),
              obscureText: true,  // This hides the password
              keyboardType: TextInputType.visiblePassword,
            ),
            ElevatedButton(
              child: Text("Giriş yap"),
              onPressed: () => context.push(const NavigationView()),
            ),
          ],
        ),
      ),
    );
  }
}
