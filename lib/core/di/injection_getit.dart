import 'package:get_it/get_it.dart';
import 'package:appointmentbooking/features/data/datasource/remote/remote_data_source.dart';
import 'package:appointmentbooking/features/data/datasource/remote/network/api_services.dart';
import 'package:appointmentbooking/features/data/repositories/doctors_repository_impl.dart';
import 'package:appointmentbooking/features/domain/repositories/doctors_repository.dart';
import 'package:appointmentbooking/features/domain/usecases/doctors_profile_usecase.dart';

import '../../features/domain/usecases/appointment_options_usecase.dart';
import '../../features/domain/usecases/booking_confirmation_usecase.dart';
import '../../features/domain/usecases/my_appointments_usecase.dart';
import '../../features/presentation/bloc/appointment_options_bloc/appointment_options_bloc.dart';
import '../../features/presentation/bloc/booking_confirmation_bloc/booking_confirmation_bloc.dart';
import '../../features/presentation/bloc/doctors_profile_bloc/doctors_profile_bloc.dart';
import '../../features/presentation/bloc/my_appointments_bloc/my_appointments_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => ApiServices());

  //bloc
  sl.registerFactory(() => GetDoctorsProfileBloc(getDoctorsProfileUseCase: sl()));
  sl.registerFactory(() => GetAppointmentOptionsBloc(getAppointmentOptionsUseCase: sl()));
  sl.registerFactory(() => GetBookingConfirmationBloc(getBookingConfirmationUseCase: sl()));
  sl.registerFactory(() => GetMyAppointmentsBloc(getMyAppointmentsUseCase: sl()));

  //use cases
  sl.registerLazySingleton(() => DoctorsProfileUseCase(sl()));
  sl.registerLazySingleton(() => AppointmentOptionsUseCase(sl()));
  sl.registerLazySingleton(() => BookingConfirmationUseCase(sl()));
  sl.registerLazySingleton(() => MyAppointmentsUseCase(sl()));

  //data sources
  sl.registerLazySingleton<DoctorsRemoteDataSource>(
      () => DoctorsRemoteDataSourceImpl(apiServices: sl()));

  //repos
  sl.registerLazySingleton<DoctorsRepository>(
    () => DoctorsProfileRepositoryImpl(remoteDataSource: sl()),
  );
}
