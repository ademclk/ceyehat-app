import 'package:ceyehat_app/domain/entities/flight_route.dart';
import 'package:ceyehat_app/domain/repositories/flight_route_repository.dart';
import 'package:ceyehat_app/infrastructure/data_sources/flight_route/flight_route_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class FlightRouteRepositoryImpl extends FlightRouteRepository {
  FlightRouteRepositoryImpl(this._remoteDataSource);

  final FlightRouteRemoteDataSource _remoteDataSource;

  @override
  Future<Either<String, FlightRouteList>> getFlightRoutes() => _remoteDataSource.getFlightRoutes();

}