import '../../Domains/models/popular_persons_model.dart';

abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteSuccessState extends FavoriteState {
  final List<PersonModel> favorites;
  FavoriteSuccessState(this.favorites);
}

class FavoriteErrorState extends FavoriteState {
  final String errorMessage;
  FavoriteErrorState(this.errorMessage);
}