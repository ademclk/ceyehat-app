import 'package:ceyehat_app/presentation/screens/auth/view/register_view.dart';
import 'package:ceyehat_app/presentation/screens/home/view/home_view.dart';
import 'package:flutter/material.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const HomeView(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          const RegisterView(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageController,
          builder: (context, _) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              clipBehavior: Clip.antiAlias,
              child: NavigationBar(
                selectedIndex: pageController.hasClients
                    ? pageController.page?.round() ?? 0
                    : 0,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                destinations: const [
                  NavigationDestination(
                      icon: Icon(
                        Icons.home,
                        size: 32,
                      ),
                      label: "Ana Sayfa"),
                  NavigationDestination(
                      icon: Icon(
                        Icons.explore,
                        size: 32,
                      ),
                      label: "Gezi"),
                  NavigationDestination(
                      icon: Icon(
                        Icons.flight,
                        size: 32,
                      ),
                      label: "Uçuşlarım"),
                  NavigationDestination(
                      icon: Icon(
                        Icons.person,
                        size: 32,
                      ),
                      label: "Ben")
                ],
                onDestinationSelected: (index) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
              ),
            );
          }),
    );
  }
}
