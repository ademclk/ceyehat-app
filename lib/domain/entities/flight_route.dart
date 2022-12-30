typedef FlightRouteList = List<FlightRoute>;

abstract class FlightRoute {
  final int id;
  final String departure;
  final String arrival;
  final int airlineId;
  final int flightNumber;
  final String departureTime;
  final String arrivalTime;
  final int price;

  FlightRoute({
    required this.id,
    required this.departure,
    required this.arrival,
    required this.departureTime,
    required this.arrivalTime,
    required this.price,
    required this.airlineId,
    required this.flightNumber,
  });
}
