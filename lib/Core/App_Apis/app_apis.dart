import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppApis {
  // Base URLs
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String originalImageBaseUrl = 'https://image.tmdb.org/t/p/original';

  // API Keys from Environment
  static String apiKey = dotenv.env['TMDB_API_KEY'] ?? '';
  static String geminiApiKey = dotenv.env['GEMINI_API_KEY'] ?? '';

  // Endpoints
  static String get popularPersons => '$baseUrl/person/popular?api_key=$apiKey';
  static String personDetails(int id) => '$baseUrl/person/$id?api_key=$apiKey';
  static String personImages(int id) => '$baseUrl/person/$id/images?api_key=$apiKey';
}