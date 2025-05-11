import 'package:flutter/material.dart';
import 'api_service.dart';
import 'city.dart';

class CityListScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cities in Saudi Arabia'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<City>>(
        future: apiService.fetchCities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: Text('Loading...'));
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final cities = snapshot.data ?? [];

          return ListView(
            padding: EdgeInsets.all(12),
            children: cities
                .map((city) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Card(
                child: ListTile(
                  title: Text(city.name),
                ),
              ),
            ))
                .toList(),
          );
        },
      ),
    );
  }
}


