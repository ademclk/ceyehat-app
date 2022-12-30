import 'package:ceyehat_app/domain/entities/flight_route.dart';

class FlightRouteModel extends FlightRoute {
  FlightRouteModel(
      {required super.id,
      required super.departure,
      required super.arrival,
      required super.departureTime,
      required super.arrivalTime,
      required super.price,
      required super.airlineId,
      required super.flightNumber});

  factory FlightRouteModel.fromJson(Map<String, dynamic> json) => FlightRouteModel(
        id: json['id'] as int,
        departure: json['departure'] as String,
        arrival: json['arrival'] as String,
        departureTime: json['departureTime'] as String,
        arrivalTime: json['arrivalTime'] as String,
        price: json['price'] as int,
        airlineId: json['airlineId'] as int,
        flightNumber: json['flightNumber'] as int,
      );
  
}
