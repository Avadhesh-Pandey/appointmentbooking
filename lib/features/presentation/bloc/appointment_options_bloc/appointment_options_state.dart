part of 'appointment_options_bloc.dart';

abstract class AppointmentOptionsState extends Equatable {
  const AppointmentOptionsState();

  @override
  List<Object> get props => [];
}

class GettingAppointmentOptionsInitiatedState extends AppointmentOptionsState {}

class LoadingAppointmentOptionsState extends AppointmentOptionsState {}

class ErrorGettingAppointmentOptionsState extends AppointmentOptionsState {}

class AppointmentOptionsRetrievedSuccessfullyState extends AppointmentOptionsState {
  final AppointmentOptionsModel result;

  const AppointmentOptionsRetrievedSuccessfullyState(this.result);

  @override
  List<Object> get props => [result];
}
