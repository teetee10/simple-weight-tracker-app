// const kLocationOptions = LocationOptions(
//     timeInterval: 10,
//     accuracy: LocationAccuracy.bestForNavigation,
//     distanceFilter: 4);

// Future<double> getLiveProximityToPin(double latitude, double longitude) async {
//   final location = await getLocation();
//   final distance = await getDistanceFromLatLonInKm(
//       latitude, longitude, location.latitude, location.longitude);
//   return distance;
// }

// Future<double> getDistanceFromLatLonInKm(
//     double lat1, double lon1, double lat2, double lon2) async {
//   final distance = await Geolocator().distanceBetween(lat1, lon1, lat2, lon2);
//   return distance;
// }

// Future<LocationData> getLocation() async {
//   final location = await Geolocator()
//       .getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
//   return location;
// }
