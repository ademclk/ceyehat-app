import 'package:ceyehat_app/domain/entities/airport.dart';

abstract class AirportRepository {
  Future<List<Airport>> getAirports();
  Future<List<Airport>> searchAirports(String query);
}
