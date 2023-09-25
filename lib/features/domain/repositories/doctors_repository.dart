import 'package:appointmentbooking/features/data/model/appointment_option_model.dart';
import 'package:appointmentbooking/features/data/model/booking_confirmation_model.dart';
import 'package:appointmentbooking/features/data/model/doctors_list_model.dart';
import 'package:appointmentbooking/features/data/model/my_appointments_model.dart';
import 'package:dartz/dartz.dart';
import 'package:appointmentbooking/core/error/failure.dart';

abstract class DoctorsRepository {
  Future<Either<Failure, List<DoctorsProfileModel>>> getDoctorsList();
  Future<Either<Failure, AppointmentOptionsModel>> getAppointmentOptions();
  Future<Either<Failure, BookingConfirmationModel>> getBookingConfirmationDetails();
  Future<Either<Failure, List<MyAppointmentsModel>>> getMyAppointments();
}
