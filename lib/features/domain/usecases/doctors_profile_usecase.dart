import 'package:appointmentbooking/features/data/model/doctors_list_model.dart';
import 'package:dartz/dartz.dart';
import 'package:appointmentbooking/core/error/failure.dart';
import 'package:appointmentbooking/core/usecases/usecase.dart';
import 'package:appointmentbooking/features/domain/repositories/doctors_repository.dart';

class DoctorsProfileUseCase implements UseCase<List<DoctorsProfileModel>, NoParams> {
  final DoctorsRepository repository;

  DoctorsProfileUseCase(this.repository);

  @override
  Future<Either<Failure, List<DoctorsProfileModel>>> call(NoParams params) async {
    return repository.getDoctorsList();
  }
}
