part of 'doctors_profile_bloc.dart';

abstract class DoctorsProfileEvent extends Equatable {
  const DoctorsProfileEvent();

  @override
  List<Object> get props => [];
}

class GetDoctorsProfileEvent extends DoctorsProfileEvent {}
