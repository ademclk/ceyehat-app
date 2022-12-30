import 'package:ceyehat_app/domain/entities/flight.dart';

class FlightModel extends Flight {
  FlightModel({required super.id});

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
        id: json['id'] as int,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
