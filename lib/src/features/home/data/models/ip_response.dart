class IpResponse {
  final String ip;
  final Location location;
  final List<String> domains;
  final As as;
  final String isp;

  IpResponse({
    required this.ip,
    required this.location,
    required this.domains,
    required this.as,
    required this.isp,
  });

  factory IpResponse.fromJson(Map<String, dynamic> json) {
    return IpResponse(
      ip: json['ip'],
      location: Location.fromJson(json['location']),
      domains: List<String>.from(json['domains']),
      as: As.fromJson(json['as']),
      isp: json['isp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ip': ip,
      'location': location.toJson(),
      'domains': domains,
      'as': as.toJson(),
      'isp': isp,
    };
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

class As {
  final int asn;
  final String name;
  final String route;
  final String domain;
  final String type;

  As({
    required this.asn,
    required this.name,
    required this.route,
    required this.domain,
    required this.type,
  });

  factory As.fromJson(Map<String, dynamic> json) {
    return As(
      asn: json['asn'],
      name: json['name'],
      route: json['route'],
      domain: json['domain'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asn': asn,
      'name': name,
      'route': route,
      'domain': domain,
      'type': type,
    };
  }
}
