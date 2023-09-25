part of 'doctors_profile_bloc.dart';

abstract class GetDoctorsProfileState extends Equatable {
  const GetDoctorsProfileState();

  @override
  List<Object> get props => [];
}

class GettingDoctorsProfileInitiatedStatus extends GetDoctorsProfileState {}

class LoadingDoctorsProfileStatus extends GetDoctorsProfileState {}

class ErrorGettingDoctorsProfileStatus extends GetDoctorsProfileState {}

class DoctorsProfileRetrievedSuccessfullyStatus extends GetDoctorsProfileState {
  final List<DoctorsProfileModel> doctorsList;

  const DoctorsProfileRetrievedSuccessfullyStatus(this.doctorsList);

  @override
  List<Object> get props => [doctorsList];
}
