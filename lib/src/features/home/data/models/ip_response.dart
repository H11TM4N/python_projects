import 'package:google_maps_flutter/google_maps_flutter.dart';

class IpResponse {
  final String ip;
  final Location location;
  final String isp;

  IpResponse({
    required this.ip,
    required this.location,
    required this.isp,
  });

  LatLng get latlng => LatLng(location.lat, location.lng);

  factory IpResponse.fromJson(Map<String, dynamic> json) {
    return IpResponse(
      ip: json['ip'],
      location: Location.fromJson(json['location']),
      isp: json['isp'],
    );
  }
}

class Location {
  final String country;
  final String region;
  final String city;
  final double lat;
  final double lng;
  final String postalCode;
  final String timezone;
  final int geonameId;

  Location({
    required this.country,
    required this.region,
    required this.city,
    required this.lat,
    required this.lng,
    required this.postalCode,
    required this.timezone,
    required this.geonameId,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      region: json['region'],
      city: json['city'],
      lat: json['lat'],
      lng: json['lng'],
      postalCode: json['postalCode'],
      timezone: json['timezone'],
      geonameId: json['geonameId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'region': region,
      'city': city,
      'lat': lat,
      'lng': lng,
      'postalCode': postalCode,
      'timezone': timezone,
      'geonameId': geonameId,
    };
  }
}
