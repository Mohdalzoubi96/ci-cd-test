// network_service.dart
abstract class NetworkService {
  Future<String> fetchData();
}

class RealNetworkService implements NetworkService {
  @override
  Future<String> fetchData() async {
    // Simulate a real network request
    return Future.delayed(const Duration(seconds: 2), () => 'Real Data');
  }
}
