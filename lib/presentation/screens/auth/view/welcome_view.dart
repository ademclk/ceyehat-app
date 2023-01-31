import 'package:ceyehat_app/core/base/state/state_x.dart';
import 'package:ceyehat_app/core/constants/dimens.dart';
import 'package:ceyehat_app/core/constants/images.dart';
import 'package:ceyehat_app/core/extensions/context_extension.dart';
import 'package:ceyehat_app/presentation/components/button_x.dart';
import 'package:ceyehat_app/presentation/screens/auth/view/login_view.dart';
import 'package:ceyehat_app/presentation/screens/auth/view/register_view.dart';
import 'package:ceyehat_app/presentation/screens/navigation/view/navigation_view.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends StateX<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Images.welcomeBackground),
                fit: BoxFit.cover)),
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black45])),
            padding: EdgeInsets.symmetric(
                vertical:
                    Dimens.paddingPageVertical + mediaQuery.padding.bottom,
                horizontal: Dimens.paddingPageHorizontal),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonX(
                text: localization.welcome,
                minWidth: double.maxFinite,
                trailing: const Icon(Icons.arrow_forward_rounded),
                onTap: () => context.push(const NavigationView()),
              ),
            )),
      ),
    );
  }
}
