import 'package:ceyehat_app/core/base/state/consumer_state_x.dart';
import 'package:ceyehat_app/core/constants/dimens.dart';
import 'package:ceyehat_app/core/enum/flightType.dart';
import 'package:ceyehat_app/presentation/screens/airport/view/airport_view.dart';
import 'package:ceyehat_app/presentation/screens/flight/view/flight_list_view.dart';
import 'package:ceyehat_app/presentation/screens/search/view/search_view.dart';
import 'package:ceyehat_app/presentation/themes/default_theme.dart';
import 'package:ceyehat_app/presentation/widgets/date_picker.dart';
import 'package:ceyehat_app/presentation/widgets/date_picker_card.dart';
import 'package:ceyehat_app/presentation/widgets/flight_selection.dart';
import 'package:ceyehat_app/presentation/widgets/flight_type_selection.dart';
import 'package:ceyehat_app/presentation/widgets/passenger_count.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/enum/flightType.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerStateX<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerStateX<HomeView> {
  String? departureAirportAbbreviation;
  String? departureAirport;
  String? arrivalAirportAbbreviation;
  String? arrivalAirport;
  DateTime? departureDate;
  DateTime? returnDate;
  DateTime? _selectedDepartureDate = DateTime.now();
  DateTime? _selectedReturnDate = DateTime.now();
  int _selectedOption = 0;

  void _handleSelectedDepartureDate(DateTime date) {
    setState(() {
      _selectedDepartureDate = date;
    });
  }

  void _handleSelectedReturnDate(DateTime date) {
    setState(() {
      _selectedReturnDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.bookAFlight),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FlightTypeSelection(
              selectedOption: _selectedOption,
              onOptionChanged: (option) {
                setState(() {
                  _selectedOption = option;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlightSelection(
                  label: "FROM",
                  airport: departureAirport ?? 'Departure Airport',
                  airportAbbreviation: departureAirportAbbreviation ?? 'DEP',
                  onTap: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AirportView(),
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        departureAirport = result.name;
                        departureAirportAbbreviation = result.iataCode;
                      });
                    }
                  },
                ),
                FlightSelection(
                  label: 'TO',
                  airport: arrivalAirport ?? 'Arrival Airport',
                  airportAbbreviation: arrivalAirportAbbreviation ?? 'ARR',
                  onTap: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AirportView(),
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        arrivalAirport = result.name;
                        arrivalAirportAbbreviation = result.iataCode;
                      });
                    }
                  },
                ),
              ],
            ),
            _selectedOption == 0
                ? _buildSingleDatePickerCard(
                    "DEPARTURE DATE", _selectedDepartureDate!)
                : _buildDoubleDatePickerCard(
                    _selectedDepartureDate!, _selectedReturnDate!),
            PassengerCard()
          ],
        ),
      ),
    );
  }

  Widget _buildSingleDatePickerCard(String label, DateTime date) {
    return DatePickerCard(
      label: label,
      date: date,
      onDateChanged: (newDate) {
        setState(() {
          _selectedDepartureDate = newDate;
        });
      },
    );
  }

  Widget _buildDoubleDatePickerCard(
      DateTime departureDate, DateTime returnDate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: DatePickerCard(
            label: 'DEPARTURE DATE',
            date: departureDate,
            onDateChanged: (newDate) {
              setState(() {
                _selectedDepartureDate = newDate;
              });
            },
          ),
        ),
        Expanded(
          child: DatePickerCard(
            label: 'RETURN DATE',
            date: returnDate,
            onDateChanged: (newDate) {
              setState(() {
                _selectedReturnDate = newDate;
              });
            },
          ),
        ),
      ],
    );
  }
}
