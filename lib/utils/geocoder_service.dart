// lib/utils/geocoder_service.dart
import 'package:geocoding/geocoding.dart';

class Station {
  final String name;
  final double latitude;
  final double longitude;

  Station(
      {required this.name, required this.latitude, required this.longitude});
}

class LocationService {
  final List<Station> stations = [
    Station(name: 'Station 1', latitude: 37.7749, longitude: -122.4194),
    Station(name: 'Station 2', latitude: 34.0522, longitude: -118.2437),
    Station(name: 'Station 3', latitude: 40.7128, longitude: -74.0060),
  ];

  Future<void> checkLocation() async {
    // Get the current location
    // Compare with station locations
    // If within a certain range, trigger alert
  }
}
