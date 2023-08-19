import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location/my_location.dart';

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low);
}

Future<MyLocation> getCurrentLocation() async {
  late MyLocation myLocation;
  await _determinePosition()
      .then((value) => myLocation = MyLocation(position: value, error: null))
      .catchError(
          (e) => myLocation = MyLocation(position: null, error: e.toString()));
  return myLocation;
}
