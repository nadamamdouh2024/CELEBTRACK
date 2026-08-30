import '../../Domains/models/person_details_model.dart';
import '../../Domains/models/person_images_model.dart';

abstract class DetailsState {}

class DetailsInitialState extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsSuccessState extends DetailsState {
  final PersonDetailsModel personDetails;
  final List<ProfileImageModel> personImages;

  DetailsSuccessState({
    required this.personDetails,
    required this.personImages,
  });
}

class DetailsErrorState extends DetailsState {
  final String errorMessage;
  DetailsErrorState(this.errorMessage);
}