import 'package:ceyehat_app/domain/entities/token.dart';

class TokenModel extends Token {
  TokenModel({required super.accessToken, required super.expireDate, required super.refreshToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        accessToken: json['accessToken'] as String,
        expireDate: DateTime.parse(json['expireDate'] as String),
        refreshToken: json['refreshToken'] as String,
      );
}
