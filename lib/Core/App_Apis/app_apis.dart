class AppApis {
  // Base URLs
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String originalImageBaseUrl = 'https://image.tmdb.org/t/p/original';

  // API Key
  static const String apiKey = '2dfe23358236069710a379edd4c65a6b';
  static const String geminiApiKey = 'AQ.Ab8RN6Jszfumyq3rWSBYurJ62xduzudUO1oDc-gpJRUfQK7YJQ';

  // Endpoints
  static const String popularPersons = '$baseUrl/person/popular?api_key=$apiKey';

  static String personDetails(int id) => '$baseUrl/person/$id?api_key=$apiKey';

  static String personImages(int id) => '$baseUrl/person/$id/images?api_key=$apiKey';
}