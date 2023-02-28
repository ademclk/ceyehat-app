import 'package:ceyehat_app/di/data_source_impl.dart';
import 'package:ceyehat_app/infrastructure/repositories/airport_repository_impl.dart';
import 'package:ceyehat_app/infrastructure/repositories/auth_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Auth
final authRepository = Provider((ref) => AuthRepositoryImpl(ref.read(authRemoteDataSource), ref.read(authLocalDataSource)));

// Airport
final airportRepository = Provider((ref) => AirportRepositoryImpl(ref.read(airportRemoteDataSource)));
