import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/Requests/person_details_request.dart';
import '../../Data/Requests/person_images_request.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final PersonDetailsRequest detailsRequest;
  final PersonImagesRequest imagesRequest;

  DetailsCubit({
    required this.detailsRequest,
    required this.imagesRequest,
  }) : super(DetailsInitialState());

  static DetailsCubit get(context) => BlocProvider.of(context);

  void getPersonDetailsAndImages(int id) async {
    emit(DetailsLoadingState());

    try {

      final results = await Future.wait([
        detailsRequest.getPersonDetails(id),
        imagesRequest.getPersonImages(id),
      ]);

      emit(DetailsSuccessState(
        personDetails: results[0] as dynamic,
        personImages: results[1] as dynamic,
      ));
    } catch (error) {
      emit(DetailsErrorState(error.toString()));
    }
  }
}