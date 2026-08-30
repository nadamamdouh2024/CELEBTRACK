import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Core/App_Apis/app_apis.dart';
import '../../Domains/models/person_details_model.dart';

class PersonDetailsRequest {
  final http.Client client;

  PersonDetailsRequest({http.Client? client}) : client = client ?? http.Client();

  Future<PersonDetailsModel> getPersonDetails(int id) async {
    final url = Uri.parse(AppApis.personDetails(id));
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PersonDetailsModel.fromJson(data);
    } else {
      throw Exception('Failed to load person details: ${response.statusCode}');
    }
  }
}