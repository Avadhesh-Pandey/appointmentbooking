import 'package:appointmentbooking/features/data/model/appointment_option_model.dart';
import 'package:appointmentbooking/features/data/model/booking_confirmation_model.dart';
import 'package:dartz/dartz.dart';
import 'package:appointmentbooking/core/error/failure.dart';
import 'package:appointmentbooking/core/usecases/usecase.dart';
import 'package:appointmentbooking/features/domain/repositories/doctors_repository.dart';

class BookingConfirmationUseCase implements UseCase<BookingConfirmationModel, NoParams> {
  final DoctorsRepository repository;

  BookingConfirmationUseCase(this.repository);

  @override
  Future<Either<Failure, BookingConfirmationModel>> call(NoParams params) async {
    return repository.getBookingConfirmationDetails();
  }
}
