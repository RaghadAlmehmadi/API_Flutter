import 'package:dio/dio.dart';
import 'city.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://countriesnow.space/api/v0.1/",
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  Future<List<City>> fetchCities() async {
    try {
      final response = await _dio.post(
        'countries/cities',
        data: {
          'country': 'Saudi Arabia',
        },
      );

      if (response.statusCode == 200 && response.data['error'] == false) {
        List<dynamic> cityNames = response.data['data'];
        return cityNames.map((name) => City(name: name)).toList();
      } else {
        throw Exception('Failed to load cities');
      }
    } catch (e) {
      throw Exception('Failed to load cities: $e');
    }
  }
}
