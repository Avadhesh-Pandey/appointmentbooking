import 'package:appointmentbooking/core/constants/color_constants.dart';
import 'package:appointmentbooking/features/data/model/doctors_list_model.dart';
import 'package:appointmentbooking/features/presentation/pages/profile/doctor_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorsListItemWidget extends StatelessWidget {
  final DoctorsProfileModel doctorsList;

  const DoctorsListItemWidget(this.doctorsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        context.go("/${DoctorProfilePage.id}",extra: doctorsList);
      },
      child: Card(
        margin: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 16.h),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  doctorsList.image ?? "",
                  height: 60.h,
                  loadingBuilder: (context,Widget child,loadingProgress)
                  {
                    if (loadingProgress == null) return child;
                    return Center(child: SizedBox(width: 60,height: 60,child: CircularProgressIndicator(color: kPrimaryColour,value: loadingProgress.expectedTotalBytes != null ?
                    loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,),));
                  },
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      doctorsList.doctorName ?? "",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black87,
                      ),
                    ),
                    // SizedBox(height: 5.h,),
                    Text(
                      doctorsList.speciality ?? "",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: kPrimaryBlue,
                          size: 20,
                        ),
                        Text(
                          doctorsList.location ?? "",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
