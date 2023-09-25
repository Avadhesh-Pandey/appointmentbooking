import 'package:appointmentbooking/features/data/model/my_appointments_model.dart';
import 'package:appointmentbooking/features/domain/usecases/my_appointments_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:appointmentbooking/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

part 'my_appointments_event.dart';
part 'my_appointments_state.dart';

class GetMyAppointmentsBloc extends Bloc<MyAppointmentsEvent, MyAppointmentsState> {
  final MyAppointmentsUseCase getMyAppointmentsUseCase;

  GetMyAppointmentsBloc({
    required this.getMyAppointmentsUseCase,
  }) : super(GettingMyAppointmentsInitiatedState()) {
    on<MyAppointmentsEvent>((event, emit) async {
      if (event is GetMyAppointmentsEvent) {
        emit(LoadingMyAppointmentsState());
        final failureOrSuccessGettingJokesStatus = await getMyAppointmentsUseCase(NoParams());
        failureOrSuccessGettingJokesStatus.fold(
          (failure) => emit(ErrorGettingMyAppointmentsState()),
          (jokes) => emit(MyAppointmentsRetrievedSuccessfullyState(jokes)),
        );
      }
    });
  }
}
