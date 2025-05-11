import 'package:flutter/material.dart';
import 'api_service.dart';
import 'city.dart';

class CityListScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cities in Saudi Arabia'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder<List<City>>(
        future: apiService.fetchCities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            List<City> cities = snapshot.data!;

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        cities[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: Text('No cities available.'));
        },
      ),
    );
  }
}

