import 'package:ceyehat_app/core/base/model/base_view_model.dart';
import 'package:ceyehat_app/core/network/network_manager.dart';
import 'package:ceyehat_app/domain/entities/airport.dart';
import 'package:ceyehat_app/domain/repositories/airport_repository.dart';
import 'package:flutter/material.dart';

class AirportViewModel extends BaseViewModel {
  AirportViewModel(this._airportRepository) {
    searchAirports("");
  }

  final AirportRepository _airportRepository;

  List<Airport> _airports = [];
  List<Airport> get airports => _airports;

  Future<void> searchAirports(String query) async {
    changeLoading(true);

    try {
      final result = await _airportRepository.searchAirports(query);
      _airports = result;
      notifyListeners();
    } catch (e) {
      // Handle error
    }

    changeLoading(false);
  }

  Future<void> getAirports() async {
    changeLoading(true);

    try {
      final result = await _airportRepository.getAirports();
      _airports = result;
      notifyListeners();
    } catch (e) {
      // Handle error
    }

    changeLoading(false);
  }
}
