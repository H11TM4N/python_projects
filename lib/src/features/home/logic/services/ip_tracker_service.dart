import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ip_address_tracker/src/features/home/data/models/models.dart';
import 'package:ip_address_tracker/src/shared/shared.dart';

class IpTrackerService {
  final http.Client client;

  IpTrackerService({http.Client? client}) : client = client ?? http.Client();

  Future<IpResponse> fetchIpDetails(String ip) async {
    final url =
        'https://geo.ipify.org/api/v2/country,city?apiKey=$yourApiKey&ipAddress=$ip';
    try {
      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        log(response.body.toString());
        return IpResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load IP details: ${response.statusCode}');
      }
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw Exception('Failed to load IP details: $e');
    }
  }
}
