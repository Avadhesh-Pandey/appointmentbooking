part of 'my_appointments_bloc.dart';

abstract class MyAppointmentsEvent extends Equatable {
  const MyAppointmentsEvent();

  @override
  List<Object> get props => [];
}

class GetMyAppointmentsEvent extends MyAppointmentsEvent {}
