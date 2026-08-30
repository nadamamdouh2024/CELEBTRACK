import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Domains/models/popular_persons_model.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitialState());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  static const String _favKey = 'favorite_persons';
  List<PersonModel> favoritesList = [];


  Future<void> getFavorites() async {
    emit(FavoriteLoadingState());
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? favStringList = prefs.getStringList(_favKey);

      if (favStringList != null) {
        favoritesList = favStringList
            .map((item) => PersonModel.fromJson(json.decode(item)))
            .toList();
      } else {
        favoritesList = [];
      }
      emit(FavoriteSuccessState(favoritesList));
    } catch (error) {
      emit(FavoriteErrorState(error.toString()));
    }
  }


  Future<void> toggleFavorite(PersonModel person) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isExist = favoritesList.any((item) => item.id == person.id);

      if (isExist) {
        favoritesList.removeWhere((item) => item.id == person.id);
      } else {
        favoritesList.add(person);
      }


      final List<String> favStringList = favoritesList
          .map((item) => json.encode(item.toJson()))
          .toList();

      await prefs.setStringList(_favKey, favStringList);
      emit(FavoriteSuccessState(List.from(favoritesList)));
    } catch (error) {
      emit(FavoriteErrorState(error.toString()));
    }
  }


  bool isFavorite(int personId) {
    return favoritesList.any((item) => item.id == personId);
  }
}