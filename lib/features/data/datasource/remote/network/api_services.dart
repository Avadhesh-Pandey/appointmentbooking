import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio(BaseOptions(baseUrl: "https://my-json-server.typicode.com/githubforekam/"));

  Future<Response> getDoctorsList() async {
    return await dio.get('doctor-appointment/doctors');
  }

  Future<Response> getAppointmentOptions() async {
    return await dio.get('doctor-appointment/appointment_options');
  }

  Future<Response> getBookingConfirmationDetails() async {
    return await dio.get('doctor-appointment/booking_confirmation');
  }

  Future<Response> getMyAppointments() async {
    return await dio.get('doctor-appointment/appointments');
  }
}
