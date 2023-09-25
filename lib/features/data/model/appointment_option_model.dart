/// duration : ["30 min","60 min"]
/// package : ["Messaging","Voice Call","Video Call","In Person"]

class AppointmentOptionsModel {
  AppointmentOptionsModel({
      List<String>? duration, 
      List<String>? package,}){
    _duration = duration;
    _package = package;
}

  AppointmentOptionsModel.fromJson(dynamic json) {
    _duration = json['duration'] != null ? json['duration'].cast<String>() : [];
    _package = json['package'] != null ? json['package'].cast<String>() : [];
  }
  List<String>? _duration;
  List<String>? _package;
AppointmentOptionsModel copyWith({  List<String>? duration,
  List<String>? package,
}) => AppointmentOptionsModel(  duration: duration ?? _duration,
  package: package ?? _package,
);
  List<String>? get duration => _duration;
  List<String>? get package => _package;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['duration'] = _duration;
    map['package'] = _package;
    return map;
  }

}