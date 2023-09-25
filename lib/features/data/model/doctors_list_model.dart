/// doctor_name : "Dr. John Doe"
/// image : "https://hireforekam.s3.ap-south-1.amazonaws.com/doctors/1-Doctor.png"
/// speciality : "Cardiologist"
/// location : "123 Health St, MedCity"
/// patients_served : 1200
/// years_of_experience : 15
/// rating : 4.7
/// number_of_reviews : 350
/// availability : {}

class DoctorsProfileModel {
  DoctorsProfileModel({
      String? doctorName, 
      String? image, 
      String? speciality, 
      String? location, 
      num? patientsServed, 
      num? yearsOfExperience, 
      num? rating, 
      num? numberOfReviews, 
      dynamic availability,}){
    _doctorName = doctorName;
    _image = image;
    _speciality = speciality;
    _location = location;
    _patientsServed = patientsServed;
    _yearsOfExperience = yearsOfExperience;
    _rating = rating;
    _numberOfReviews = numberOfReviews;
    _availability = availability;
}

  DoctorsProfileModel.fromJson(dynamic json) {
    _doctorName = json['doctor_name'];
    _image = json['image'];
    _speciality = json['speciality'];
    _location = json['location'];
    _patientsServed = json['patients_served'];
    _yearsOfExperience = json['years_of_experience'];
    _rating = json['rating'];
    _numberOfReviews = json['number_of_reviews'];
    _availability = json['availability'];
  }
  String? _doctorName;
  String? _image;
  String? _speciality;
  String? _location;
  num? _patientsServed;
  num? _yearsOfExperience;
  num? _rating;
  num? _numberOfReviews;
  dynamic _availability;
DoctorsProfileModel copyWith({  String? doctorName,
  String? image,
  String? speciality,
  String? location,
  num? patientsServed,
  num? yearsOfExperience,
  num? rating,
  num? numberOfReviews,
  dynamic availability,
}) => DoctorsProfileModel(  doctorName: doctorName ?? _doctorName,
  image: image ?? _image,
  speciality: speciality ?? _speciality,
  location: location ?? _location,
  patientsServed: patientsServed ?? _patientsServed,
  yearsOfExperience: yearsOfExperience ?? _yearsOfExperience,
  rating: rating ?? _rating,
  numberOfReviews: numberOfReviews ?? _numberOfReviews,
  availability: availability ?? _availability,
);
  String? get doctorName => _doctorName;
  String? get image => _image;
  String? get speciality => _speciality;
  String? get location => _location;
  num? get patientsServed => _patientsServed;
  num? get yearsOfExperience => _yearsOfExperience;
  num? get rating => _rating;
  num? get numberOfReviews => _numberOfReviews;
  dynamic get availability => _availability;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctor_name'] = _doctorName;
    map['image'] = _image;
    map['speciality'] = _speciality;
    map['location'] = _location;
    map['patients_served'] = _patientsServed;
    map['years_of_experience'] = _yearsOfExperience;
    map['rating'] = _rating;
    map['number_of_reviews'] = _numberOfReviews;
    map['availability'] = _availability;
    return map;
  }

}