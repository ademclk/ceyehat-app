import 'package:ceyehat_app/domain/entities/airport.dart';
import 'package:ceyehat_app/domain/repositories/airport_repository.dart';
import 'package:ceyehat_app/presentation/screens/airport/view_model/airport_view_model.dart';
import 'package:ceyehat_app/presentation/screens/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../di/repository_impl.dart';

final airportViewModelProvider = ChangeNotifierProvider(
    (ref) => AirportViewModel(ref.read(airportRepository)));

class AirportView extends ConsumerWidget {
  const AirportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final airportViewModel = ref.watch(airportViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Airports'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                airportViewModel.searchAirports(value);
              },
              decoration: InputDecoration(
                hintText: 'Search airports',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: airportViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: airportViewModel.airports.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Airport airport = airportViewModel.airports[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the next screen and pass the selected airport object
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ));
                        },
                        child: ListTile(
                          title: Text('${airport.cityName}, ${airport.countryName}'),
                          subtitle:
                              Text('${airport.iataCode} - ${airport.name}'),
                          onTap: () {
                            Navigator.of(context).pop(airport);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
