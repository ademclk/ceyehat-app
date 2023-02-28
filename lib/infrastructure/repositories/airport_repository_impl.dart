import 'package:ceyehat_app/core/network/network_manager.dart';
import 'package:ceyehat_app/domain/entities/airport.dart';
import 'package:ceyehat_app/domain/repositories/airport_repository.dart';
import 'package:ceyehat_app/infrastructure/data_sources/airport/airport_remote_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AirportRepositoryImpl implements AirportRepository {
  AirportRepositoryImpl(this._remoteDataSource);

  final AirportRemoteDataSource _remoteDataSource;

  @override
  Future<List<Airport>> getAirports() {
    return _remoteDataSource.getAirports();
  }

  @override
  Future<List<Airport>> searchAirports(String query) {
    return _remoteDataSource.searchAirports(query);
  }
}