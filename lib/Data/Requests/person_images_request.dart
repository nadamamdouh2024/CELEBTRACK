import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Core/App_Apis/app_apis.dart';
import '../../Domains/models/person_images_model.dart';

class PersonImagesRequest {
  final http.Client client;

  PersonImagesRequest({http.Client? client}) : client = client ?? http.Client();

  Future<List<ProfileImageModel>> getPersonImages(int id) async {
    final url = Uri.parse(AppApis.personImages(id));
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final imagesResponse = PersonImagesResponse.fromJson(data);
      return imagesResponse.profiles;
    } else {
      throw Exception('Failed to load person images: ${response.statusCode}');
    }
  }
}