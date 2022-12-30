import 'package:ceyehat_app/core/network/network_manager.dart';
import 'package:ceyehat_app/domain/entities/flight_route.dart';
import 'package:ceyehat_app/infrastructure/models/flight_route_model.dart';
import 'package:dartz/dartz.dart';

class FlightRouteRemoteDataSource {
  FlightRouteRemoteDataSource(this._networkManager);
  final NetworkManager _networkManager;

  Future<Either<String, FlightRouteList>> getFlightRoutes() =>
      _networkManager.get('path').then((value) => right((value.data as List)
          .map((e) => FlightRouteModel.fromJson(e))
          .toList()));
}
