import 'package:ceyehat_app/core/network/network_manager.dart';
import 'package:ceyehat_app/domain/entities/airport.dart';

const _getAirportPath = 'api/airport';
const _searchAirportPath = 'api/airport/search';

class AirportRemoteDataSource {
  const AirportRemoteDataSource(this._networkManager);

  final NetworkManager _networkManager;

  Future<List<Airport>> getAirports() async {
    final res = await _networkManager.get(_getAirportPath);
    final List<dynamic> data = res.data as List<dynamic>;
    return data
        .map((e) => Airport.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<Airport>> searchAirports(String query) async {
    final res = await _networkManager
        .get(_searchAirportPath, queryParameters: {'query': query});
    final List<dynamic> data = res.data as List<dynamic>;
    return data
        .map((e) => Airport.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
