import 'package:ceyehat_app/core/extensions/context_extension.dart';
import 'package:ceyehat_app/presentation/screens/auth/view/login_view.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          image: DecorationImage(
            image: AssetImage("assets/images/welcome_background.jpeg"),
            fit: BoxFit.fitHeight
          )
        ),
        child: Center(
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 160),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 50)),
              child: Text("Hoş geldiniz",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
              onPressed: () => context.push(const LoginView()),
              ),
            ),
          ),
        ),
      );
  }
}
