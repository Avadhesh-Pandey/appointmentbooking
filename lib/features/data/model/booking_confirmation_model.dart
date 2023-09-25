/// doctor_name : "Dr. John Doe"
/// appointment_date : "2023-09-18"
/// appointment_time : "09:00 AM - 09:30 AM"
/// location : "123 Health St, MedCity"
/// appointment_package : "Video Call"

class BookingConfirmationModel {
  BookingConfirmationModel({
      String? doctorName, 
      String? appointmentDate, 
      String? appointmentTime, 
      String? location, 
      String? appointmentPackage,}){
    _doctorName = doctorName;
    _appointmentDate = appointmentDate;
    _appointmentTime = appointmentTime;
    _location = location;
    _appointmentPackage = appointmentPackage;
}

  BookingConfirmationModel.fromJson(dynamic json) {
    _doctorName = json['doctor_name'];
    _appointmentDate = json['appointment_date'];
    _appointmentTime = json['appointment_time'];
    _location = json['location'];
    _appointmentPackage = json['appointment_package'];
  }
  String? _doctorName;
  String? _appointmentDate;
  String? _appointmentTime;
  String? _location;
  String? _appointmentPackage;
BookingConfirmationModel copyWith({  String? doctorName,
  String? appointmentDate,
  String? appointmentTime,
  String? location,
  String? appointmentPackage,
}) => BookingConfirmationModel(  doctorName: doctorName ?? _doctorName,
  appointmentDate: appointmentDate ?? _appointmentDate,
  appointmentTime: appointmentTime ?? _appointmentTime,
  location: location ?? _location,
  appointmentPackage: appointmentPackage ?? _appointmentPackage,
);
  String? get doctorName => _doctorName;
  String? get appointmentDate => _appointmentDate;
  String? get appointmentTime => _appointmentTime;
  String? get location => _location;
  String? get appointmentPackage => _appointmentPackage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctor_name'] = _doctorName;
    map['appointment_date'] = _appointmentDate;
    map['appointment_time'] = _appointmentTime;
    map['location'] = _location;
    map['appointment_package'] = _appointmentPackage;
    return map;
  }

}