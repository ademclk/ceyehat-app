import 'package:ceyehat_app/core/database/database.dart';
import 'package:ceyehat_app/core/network/network_manager.dart';
import 'package:ceyehat_app/infrastructure/data_sources/auth/auth_local_data_source.dart';
import 'package:ceyehat_app/infrastructure/data_sources/auth/auth_remote_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Auth
final authRemoteDataSource = Provider((ref) => AuthRemoteDataSource(NetworkManager.instance));
final authLocalDataSource = Provider((ref) => AuthLocalDataSource(Database.tokenBox, Database.userBox));
