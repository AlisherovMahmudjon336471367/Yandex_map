class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({
    required this.lat,
    required this.long,
  });
}

class UlugnortumaniLocation extends AppLatLong {
  // 40.8527702,71.7440431
  const UlugnortumaniLocation({
    super.long = 71.7440431,
    super.lat = 40.8527702,
  });
}
