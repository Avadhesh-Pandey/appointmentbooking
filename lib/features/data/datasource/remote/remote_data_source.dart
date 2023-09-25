import 'dart:async';

import 'package:appointmentbooking/core/error/failure.dart';
import 'package:appointmentbooking/features/data/datasource/remote/network/api_services.dart';
import 'package:appointmentbooking/features/data/model/appointment_option_model.dart';
import 'package:appointmentbooking/features/data/model/booking_confirmation_model.dart';
import 'package:appointmentbooking/features/data/model/doctors_list_model.dart';
import '../../model/my_appointments_model.dart';

abstract class DoctorsRemoteDataSource {
  Future<List<DoctorsProfileModel>> getDoctorsList();
  Future<AppointmentOptionsModel> getAppointmentOptions();
  Future<BookingConfirmationModel> getBookingConfirmationDetails();
  Future<List<MyAppointmentsModel>> getMyAppointments();
}

class DoctorsRemoteDataSourceImpl implements DoctorsRemoteDataSource {
  final ApiServices apiServices;

  DoctorsRemoteDataSourceImpl({
    required this.apiServices,
  });

  @override
  Future<List<DoctorsProfileModel>> getDoctorsList() async {
    try {
      var response = await apiServices.getDoctorsList();
      List<DoctorsProfileModel> list=[];
      // list.forEach((element) { })
      response.data.forEach((e){
        list.add(DoctorsProfileModel.fromJson(e));
      });
      return list;
    } catch (e) {
      throw APIFailure("API failure");
    }
  }

  @override
  Future<AppointmentOptionsModel> getAppointmentOptions() async {
    try {
      var response = await apiServices.getAppointmentOptions();
      return AppointmentOptionsModel.fromJson(response.data);
    } catch (e) {
      throw APIFailure("API failure");
    }
  }

  @override
  Future<BookingConfirmationModel> getBookingConfirmationDetails() async {
    try {
      var response = await apiServices.getBookingConfirmationDetails();
      return BookingConfirmationModel.fromJson(response.data);
    } catch (e) {
      throw APIFailure("API failure");
    }
  }

  @override
  Future<List<MyAppointmentsModel>> getMyAppointments() async {
    try {
      ///Getting image url from the listing api
      var doctorsListResponse = await apiServices.getDoctorsList();
      Map<String,String> imagesMap={};
      doctorsListResponse.data.forEach((e){
        String name= e['doctor_name'];
        String url= e['image'];
        imagesMap[name]=url;
      });


      var response = await apiServices.getMyAppointments();
      List<MyAppointmentsModel> list=[];
      response.data.forEach((e){
        e["image_url"]=imagesMap[e["doctor_name"]];
        list.add(MyAppointmentsModel.fromJson(e));
      });
      return list;
    } catch (e) {
      throw APIFailure("API failure");
    }
  }
}
