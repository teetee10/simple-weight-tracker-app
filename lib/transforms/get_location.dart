import 'package:geolocator/geolocator.dart';

Future<Position> getLocation() async {
  final location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation);
  return location;
}
