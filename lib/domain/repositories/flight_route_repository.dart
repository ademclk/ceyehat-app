import 'package:ceyehat_app/domain/entities/flight_route.dart';
import 'package:dartz/dartz.dart';

abstract class FlightRouteRepository {
  Future<Either<String, FlightRouteList>> getFlightRoutes();
}