import 'package:hive_flutter/hive_flutter.dart';

part 'token.g.dart';

@HiveType(typeId: 0)
class Token {
  @HiveField(0)
  final String accessToken;

  @HiveField(1)
  final DateTime expireDate;

  @HiveField(2)
  final String refreshToken;

  Token({required this.accessToken, required this.expireDate, required this.refreshToken});
}
