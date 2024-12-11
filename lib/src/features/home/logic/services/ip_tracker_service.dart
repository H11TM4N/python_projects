import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ip_address_tracker/src/features/home/data/models/models.dart';
import 'package:ip_address_tracker/src/shared/shared.dart';

class IpTrackerService {
  Future<IpResponse> fetchIpDetails(String ip) async {
    final url =
        'https://geo.ipify.org/api/v2/country,city?apiKey=$yourApiKey&ipAddress=$ip';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return IpResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to load IP details: ${response.statusCode}');
    }
  }
}
