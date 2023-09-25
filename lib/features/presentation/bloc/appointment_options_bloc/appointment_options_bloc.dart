import 'package:appointmentbooking/features/data/model/my_appointments_model.dart';
import 'package:appointmentbooking/features/domain/usecases/my_appointments_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:appointmentbooking/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/appointment_option_model.dart';
import '../../../domain/usecases/appointment_options_usecase.dart';

part 'appointment_options_event.dart';
part 'appointment_options_state.dart';

class GetAppointmentOptionsBloc extends Bloc<AppointmentOptionsEvent, AppointmentOptionsState> {
  final AppointmentOptionsUseCase getAppointmentOptionsUseCase;

  GetAppointmentOptionsBloc({
    required this.getAppointmentOptionsUseCase,
  }) : super(GettingAppointmentOptionsInitiatedState()) {
    on<AppointmentOptionsEvent>((event, emit) async {
      if (event is GetAppointmentOptionsEvent) {
        emit(LoadingAppointmentOptionsState());
        final failureOrSuccessGettingJokesStatus = await getAppointmentOptionsUseCase(NoParams());
        failureOrSuccessGettingJokesStatus.fold(
          (failure) => emit(ErrorGettingAppointmentOptionsState()),
          (result) => emit(AppointmentOptionsRetrievedSuccessfullyState(result)),
        );
      }
    });
  }
}
