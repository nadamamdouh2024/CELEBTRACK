import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/Requests/popular_persons_request.dart';
import 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final PopularPersonsRequest popularPersonsRequest;

  PopularCubit(this.popularPersonsRequest) : super(PopularInitialState());

  static PopularCubit get(context) => BlocProvider.of(context);

  void getPopularPersons() async {
    emit(PopularLoadingState());

    try {
      final persons = await popularPersonsRequest.getPopularPersons();
      emit(PopularSuccessState(persons));
    } catch (error) {
      emit(PopularErrorState(error.toString()));
    }
  }
}