part of 'appointment_options_bloc.dart';

abstract class AppointmentOptionsEvent extends Equatable {
  const AppointmentOptionsEvent();

  @override
  List<Object> get props => [];
}

class GetAppointmentOptionsEvent extends AppointmentOptionsEvent {}
