class PersonImagesResponse {
  final int id;
  final List<ProfileImageModel> profiles;

  PersonImagesResponse({
    required this.id,
    required this.profiles,
  });

  factory PersonImagesResponse.fromJson(Map<String, dynamic> json) {
    return PersonImagesResponse(
      id: json['id'] ?? 0,
      profiles: (json['profiles'] as List<dynamic>?)
          ?.map((item) => ProfileImageModel.fromJson(item))
          .toList() ??
          [],
    );
  }
}

class ProfileImageModel {
  final String filePath;
  final double aspectRatio;
  final int height;
  final int width;

  ProfileImageModel({
    required this.filePath,
    required this.aspectRatio,
    required this.height,
    required this.width,
  });

  factory ProfileImageModel.fromJson(Map<String, dynamic> json) {
    return ProfileImageModel(
      filePath: json['file_path'] ?? '',
      aspectRatio: (json['aspect_ratio'] as num?)?.toDouble() ?? 0.0,
      height: json['height'] ?? 0,
      width: json['width'] ?? 0,
    );
  }
}