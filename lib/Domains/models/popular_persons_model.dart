class PopularPersonsResponse {
  final int page;
  final List<PersonModel> results;
  final int totalPages;
  final int totalResults;

  PopularPersonsResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularPersonsResponse.fromJson(Map<String, dynamic> json) {
    return PopularPersonsResponse(
      page: json['page'] ?? 1,
      results: (json['results'] as List<dynamic>?)
          ?.map((item) => PersonModel.fromJson(item))
          .toList() ??
          [],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }
}

class PersonModel {
  final int id;
  final String name;
  final String? profilePath;
  final String knownForDepartment;
  final double popularity;

  PersonModel({
    required this.id,
    required this.name,
    this.profilePath,
    required this.knownForDepartment,
    required this.popularity,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      profilePath: json['profile_path'],
      knownForDepartment: json['known_for_department'] ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profile_path': profilePath,
      'known_for_department': knownForDepartment,
      'popularity': popularity,
    };
  }
}