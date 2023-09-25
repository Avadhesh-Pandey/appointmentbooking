import 'package:appointmentbooking/features/data/model/doctors_list_model.dart';
import 'package:appointmentbooking/features/data/model/my_appointments_model.dart';
import 'package:dartz/dartz.dart';
import 'package:appointmentbooking/core/error/failure.dart';
import 'package:appointmentbooking/core/usecases/usecase.dart';
import 'package:appointmentbooking/features/domain/repositories/doctors_repository.dart';

class MyAppointmentsUseCase implements UseCase<List<MyAppointmentsModel>, NoParams> {
  final DoctorsRepository repository;

  MyAppointmentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<MyAppointmentsModel>>> call(NoParams params) async {
    return repository.getMyAppointments();
  }
}
