/// booking_id : "A123"
/// doctor_name : "Dr. John Doe"
/// location : "123 Health St, MedCity"
/// appointment_date : "2023-09-18"
/// appointment_time : "09:00 AM - 09:30 AM"

class MyAppointmentsModel {
  MyAppointmentsModel({
      String? bookingId, 
      String? imageUrl,
      String? doctorName,
      String? location, 
      String? appointmentDate, 
      String? appointmentTime,}){
    _bookingId = bookingId;
    _imageUrl = imageUrl;
    _doctorName = doctorName;
    _location = location;
    _appointmentDate = appointmentDate;
    _appointmentTime = appointmentTime;
}

  MyAppointmentsModel.fromJson(dynamic json) {
    _bookingId = json['booking_id'];
    _imageUrl = json['image_url'];
    _doctorName = json['doctor_name'];
    _location = json['location'];
    _appointmentDate = json['appointment_date'];
    _appointmentTime = json['appointment_time'];
  }
  String? _bookingId;
  String? _imageUrl;
  String? _doctorName;
  String? _location;
  String? _appointmentDate;
  String? _appointmentTime;
MyAppointmentsModel copyWith({  String? bookingId,
  String? imageUrl,
  String? doctorName,
  String? location,
  String? appointmentDate,
  String? appointmentTime,
}) => MyAppointmentsModel(  bookingId: bookingId ?? _bookingId,
  imageUrl: imageUrl ?? _imageUrl,
  doctorName: doctorName ?? _doctorName,
  location: location ?? _location,
  appointmentDate: appointmentDate ?? _appointmentDate,
  appointmentTime: appointmentTime ?? _appointmentTime,
);
  String? get imageUrl => _imageUrl;
  String? get bookingId => _bookingId;
  String? get doctorName => _doctorName;
  String? get location => _location;
  String? get appointmentDate => _appointmentDate;
  String? get appointmentTime => _appointmentTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['booking_id'] = _bookingId;
    map['doctor_name'] = _doctorName;
    map['location'] = _location;
    map['appointment_date'] = _appointmentDate;
    map['appointment_time'] = _appointmentTime;
    return map;
  }

}