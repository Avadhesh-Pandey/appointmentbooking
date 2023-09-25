import 'package:appointmentbooking/features/data/model/doctors_list_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:appointmentbooking/core/usecases/usecase.dart';
import 'package:appointmentbooking/features/domain/usecases/doctors_profile_usecase.dart';

part 'doctors_profile_event.dart';
part 'doctors_profile_state.dart';

class GetDoctorsProfileBloc extends Bloc<DoctorsProfileEvent, GetDoctorsProfileState> {
  final DoctorsProfileUseCase getDoctorsProfileUseCase;

  GetDoctorsProfileBloc({
    required this.getDoctorsProfileUseCase,
  }) : super(GettingDoctorsProfileInitiatedStatus()) {
    on<DoctorsProfileEvent>((event, emit) async {
      if (event is GetDoctorsProfileEvent) {
        emit(LoadingDoctorsProfileStatus());
        final failureOrSuccessGettingJokesStatus = await getDoctorsProfileUseCase(NoParams());
        failureOrSuccessGettingJokesStatus.fold(
          (failure) => emit(ErrorGettingDoctorsProfileStatus()),
          (jokes) => emit(DoctorsProfileRetrievedSuccessfullyStatus(jokes)),
        );
      }
    });
  }
}
