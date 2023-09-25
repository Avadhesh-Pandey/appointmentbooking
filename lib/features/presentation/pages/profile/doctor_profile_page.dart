import 'package:appointmentbooking/core/constants/color_constants.dart';
import 'package:appointmentbooking/features/data/model/doctors_list_model.dart';
import 'package:appointmentbooking/features/presentation/pages/profile/widgets/day_time_availability_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/params/booking_detail_params.dart';
import '../select_package/select_package_page.dart';

class DoctorProfilePage extends StatelessWidget {
  static const id = "doctors_profile";

  DateTime? selectedTimeSlot;
  final DoctorsProfileModel doctorsData;

  DoctorProfilePage(this.doctorsData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Book Appointment",
          style: TextStyle(fontSize: 16.sp, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(right: 16.w,left: 16.w,top: 16.h,bottom: 8.h),
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
            border: Border.all(color: kDividerColor),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryBlue,
            minimumSize: Size.fromHeight(45.h)
          ),
          child: Text("Make Appointment",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            if(selectedTimeSlot!=null)
              {
                context.go("/${SelectPackagePage.id}",extra: BookingDetailParams(doctorsProfile: doctorsData,selectedTimeSlot: selectedTimeSlot!));
              }
            else
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please select a time slot",style: TextStyle(fontSize: 12.sp, color: Colors.white),),
                  ),
                );
              }
          },
        ),
      ),

      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h, bottom: 16.h),
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  doctorsData.image ?? "",
                  height: 80.h,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      doctorsData.doctorName ?? "",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black87,
                      ),
                    ),
                    // SizedBox(height: 5.h,),
                    Text(
                      doctorsData.speciality ?? "",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: kPrimaryBlue,
                          size: 20,
                        ),
                        Text(
                          doctorsData.location ?? "",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black54,
                          ),
                        ),
                        const Icon(
                          Icons.map_outlined,
                          color: kPrimaryBlue,
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 48.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    const ClipOval(
                        child: Material(
                      color: kPrimaryBlueBG,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.people_alt,
                          color: kPrimaryBlue,
                          size: 20,
                        ),
                      ),
                    )),
                    Text(
                      "${doctorsData.patientsServed}+",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: kPrimaryBlue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Text(
                      "Patients",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    const ClipOval(
                        child: Material(
                      color: kPrimaryBlueBG,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.shopping_bag,
                          color: kPrimaryBlue,
                          size: 20,
                        ),
                      ),
                    )),
                    Text(
                      "${doctorsData.yearsOfExperience}+",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: kPrimaryBlue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Text(
                      "Years Exp.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    const ClipOval(
                        child: Material(
                      color: kPrimaryBlueBG,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.stars,
                          color: kPrimaryBlue,
                          size: 20,
                        ),
                      ),
                    )),
                    Text(
                      "${doctorsData.rating}+",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: kPrimaryBlue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Text(
                      "Rating",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    const ClipOval(
                        child: Material(
                      color: kPrimaryBlueBG,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.message_outlined,
                          color: kPrimaryBlue,
                          size: 20,
                        ),
                      ),
                    )),
                    Text(
                      "${doctorsData.numberOfReviews}",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: kPrimaryBlue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Text(
                      "Reviews",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 32.h,
          ),
          Text(
            "BOOK APPOINTMENT",
            style: TextStyle(fontSize: 14.sp, color: Colors.black54, letterSpacing: 2),
          ),
          DayTimeAvailabilityWidget(
            doctorsData.availability as Map<String, dynamic>,
            selectedTimeSlot: (time) {
              selectedTimeSlot = time;
              debugPrint("SelectedTimeSlot $time");
            },
          ),
        ],
      ),
    );
  }
}
