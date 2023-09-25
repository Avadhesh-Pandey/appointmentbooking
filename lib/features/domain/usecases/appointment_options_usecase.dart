import 'package:appointmentbooking/features/data/model/appointment_option_model.dart';
import 'package:dartz/dartz.dart';
import 'package:appointmentbooking/core/error/failure.dart';
import 'package:appointmentbooking/core/usecases/usecase.dart';
import 'package:appointmentbooking/features/domain/repositories/doctors_repository.dart';

class AppointmentOptionsUseCase implements UseCase<AppointmentOptionsModel, NoParams> {
  final DoctorsRepository repository;

  AppointmentOptionsUseCase(this.repository);

  @override
  Future<Either<Failure, AppointmentOptionsModel>> call(NoParams params) async {
    return repository.getAppointmentOptions();
  }
}
