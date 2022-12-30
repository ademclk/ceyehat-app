import 'package:ceyehat_app/domain/entities/flight.dart';
import 'package:dartz/dartz.dart';

abstract class FlightRepository {
  Future<Either<String, FlightList>> getFlights();
}
