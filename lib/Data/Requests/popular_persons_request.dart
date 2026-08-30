import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Core/App_Apis/app_apis.dart';
import '../../Domains/models/popular_persons_model.dart';

class PopularPersonsRequest {
  final http.Client client;

  PopularPersonsRequest({http.Client? client}) : client = client ?? http.Client();

  Future<List<PersonModel>> getPopularPersons({int page = 1}) async {
    final url = Uri.parse('${AppApis.popularPersons}&page=$page');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final popularResponse = PopularPersonsResponse.fromJson(data);
      return popularResponse.results;
    } else {
      throw Exception('Failed to load popular persons: ${response.statusCode}');
    }
  }
}