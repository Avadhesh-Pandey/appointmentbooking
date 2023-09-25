import 'package:appointmentbooking/features/data/model/doctors_list_model.dart';

class BookingDetailParams {
  DoctorsProfileModel doctorsProfile;
  DateTime? selectedTimeSlot;
  String? duration;
  String? package;
  String? bookingFor;

  BookingDetailParams(
      {required this.doctorsProfile,
      this.selectedTimeSlot,
      this.duration,
      this.package,
      this.bookingFor});
}
