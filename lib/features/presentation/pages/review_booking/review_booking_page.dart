import 'package:appointmentbooking/core/params/booking_detail_params.dart';
import 'package:appointmentbooking/core/utils/extensions/date_time_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/color_constants.dart';
import '../booking_confirmation/booking_confirmation_page.dart';

class ReviewBookingPage extends StatelessWidget {
  static const id = "review_booking";
  final BookingDetailParams bookingParams;

  const ReviewBookingPage(this.bookingParams, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Review Summary",
          style: TextStyle(fontSize: 16.sp, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h, bottom: 8.h),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          border: Border.all(color: kDividerColor),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryBlue, minimumSize: Size.fromHeight(45.h)),
          child: Text(
            "Confirm",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            context.go("/${BookingConfirmationPage.id}");
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  bookingParams.doctorsProfile.image ?? "",
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
                      bookingParams.doctorsProfile.doctorName ?? "",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black87,
                      ),
                    ),
                    // SizedBox(height: 5.h,),
                    Text(
                      bookingParams.doctorsProfile.speciality ?? "",
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
                          bookingParams.doctorsProfile.location ?? "",
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
          SummaryDetailsWidget("Date & Hour", "${bookingParams.selectedTimeSlot?.format("MMMM dd, yyyy")} | ${bookingParams.selectedTimeSlot?.format("h:mm a")}"),
          SizedBox(height: 8.h),
          SummaryDetailsWidget("Package", "${bookingParams.package}"),
          SizedBox(height: 8.h),
          SummaryDetailsWidget("Duration", "${bookingParams.duration}"),
          SizedBox(height: 8.h),
          SummaryDetailsWidget("Booking for", bookingParams.bookingFor??"Self"),
        ],
      ),
    );
  }
}

class SummaryDetailsWidget extends StatelessWidget {
  final String s;
  final String t;

  const SummaryDetailsWidget(this.s, this.t, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          s,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black54,
          ),
        ),
        Text(
          t,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
