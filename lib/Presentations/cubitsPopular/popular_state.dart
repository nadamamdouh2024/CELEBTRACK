import '../../Domains/models/popular_persons_model.dart';

abstract class PopularState {}

class PopularInitialState extends PopularState {}

class PopularLoadingState extends PopularState {}

class PopularSuccessState extends PopularState {
  final List<PersonModel> persons;
  PopularSuccessState(this.persons);
}

class PopularErrorState extends PopularState {
  final String errorMessage;
  PopularErrorState(this.errorMessage);
}