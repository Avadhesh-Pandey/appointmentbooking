import 'package:appointmentbooking/features/data/model/appointment_option_model.dart';
import 'package:appointmentbooking/features/data/model/booking_confirmation_model.dart';
import 'package:appointmentbooking/features/data/model/doctors_list_model.dart';
import 'package:appointmentbooking/features/data/model/my_appointments_model.dart';
import 'package:dartz/dartz.dart';
import 'package:appointmentbooking/core/error/failure.dart';
import 'package:appointmentbooking/features/data/datasource/remote/remote_data_source.dart';
import 'package:appointmentbooking/features/domain/repositories/doctors_repository.dart';

class DoctorsProfileRepositoryImpl implements DoctorsRepository {
  final DoctorsRemoteDataSource remoteDataSource;

  DoctorsProfileRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<DoctorsProfileModel>>> getDoctorsList() async {
    try {
      var response = await remoteDataSource.getDoctorsList();
      return right(response);
    } catch (e) {
      throw APIFailure("API failure");
    }
  }

  @override
  Future<Either<Failure, AppointmentOptionsModel>> getAppointmentOptions() async {
    try {
      var response = await remoteDataSource.getAppointmentOptions();
      return right(response);
    } catch (e) {
      throw APIFailure("API failure");
    }
  }

  @override
  Future<Either<Failure, BookingConfirmationModel>> getBookingConfirmationDetails() async {
    try {
      var response = await remoteDataSource.getBookingConfirmationDetails();
      return right(response);
    } catch (e) {
      throw APIFailure("API failure");
    }
  }

  @override
  Future<Either<Failure, List<MyAppointmentsModel>>> getMyAppointments() async {
    try {
      var response = await remoteDataSource.getMyAppointments();
      return right(response);
    } catch (e) {
      throw APIFailure("API failure");
    }
  }
}
