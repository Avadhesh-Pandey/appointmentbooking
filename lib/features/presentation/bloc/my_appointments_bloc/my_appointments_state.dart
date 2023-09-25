part of 'my_appointments_bloc.dart';

abstract class MyAppointmentsState extends Equatable {
  const MyAppointmentsState();

  @override
  List<Object> get props => [];
}

class GettingMyAppointmentsInitiatedState extends MyAppointmentsState {}

class LoadingMyAppointmentsState extends MyAppointmentsState {}

class ErrorGettingMyAppointmentsState extends MyAppointmentsState {}

class MyAppointmentsRetrievedSuccessfullyState extends MyAppointmentsState {
  final List<MyAppointmentsModel> doctorsList;

  const MyAppointmentsRetrievedSuccessfullyState(this.doctorsList);

  @override
  List<Object> get props => [doctorsList];
}
