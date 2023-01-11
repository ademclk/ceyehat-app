import 'package:ceyehat_app/presentation/screens/flight/view/flight_list_view.dart';
import 'package:ceyehat_app/presentation/screens/search/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1200'),
              ),
              SizedBox(width: 10),
              Text('Adem Onur Çelik')
            ],
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              const SearchView(),
              Expanded(
                  child: ListView.separated(
                    itemCount: 8,
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return const FlightListView();
                  },
              ))
            ],
          ),
        ));
  }
}
