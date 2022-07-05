import 'package:geolocator/geolocator.dart';

dynamic getDistanceBetweenLatsLngs({
    startLatitude,
    startLongitude,
    endLatitude,
    endLongitude,
    type = 'unformatted'}) {
  Map result;
  double distanceInMeters;
  double startLatitude = 0;
  double startLongitude = 0;
  double endLatitude = 0;
  double endLongitude = 0;

  distanceInMeters = Geolocator.distanceBetween(
    startLatitude,
    startLongitude,
    endLatitude,
    endLongitude,
  );

  var distanceInMeter = distanceInMeters;
  const String meters = 'm';
  const String kilometers = 'km';
  final metric = distanceInMeter < 1000 ? meters : kilometers;
  final distance = (distanceInMeter / (metric != meters ? 1000 : 1)).floor().toString();
  final distanceFormatted = distance + metric;
  result = {'unformatted': distance, 'formatted': distanceFormatted}; //
  return result[type]; // 0 meters
}
