import 'package:appointmentbooking/features/data/model/doctors_list_model.dart';
import 'package:appointmentbooking/features/presentation/pages/doctors_list/widgets/doctor_list_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListWidget extends StatelessWidget{
  final List<DoctorsProfileModel> doctorsList;
  const DoctorsListWidget(this.doctorsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 16.h,bottom: 16.h),
      itemCount: doctorsList.length,
        itemBuilder: (context,index)
    {
      return DoctorsListItemWidget(doctorsList[index]);
    });
  }

}