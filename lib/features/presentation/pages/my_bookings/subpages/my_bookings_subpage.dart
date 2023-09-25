import 'package:appointmentbooking/core/utils/extensions/date_time_ext.dart';
import 'package:appointmentbooking/features/data/model/booking_confirmation_model.dart';
import 'package:appointmentbooking/features/data/model/my_appointments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../../bloc/booking_confirmation_bloc/booking_confirmation_bloc.dart';
import '../../../bloc/my_appointments_bloc/my_appointments_bloc.dart';

class MyBookingSubpage extends StatefulWidget {
  const MyBookingSubpage({super.key});

  @override
  State<StatefulWidget> createState() => _MyBookingSubpageState();
}

class _MyBookingSubpageState extends State<MyBookingSubpage> {
  @override
  void initState() {
    BlocProvider.of<GetMyAppointmentsBloc>(context).add(GetMyAppointmentsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Bookings",
          style: TextStyle(fontSize: 16.sp, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<GetMyAppointmentsBloc>(context),
        builder: (context, state) {
          if (state is MyAppointmentsRetrievedSuccessfullyState) {
            return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                itemCount: state.doctorsList.length,
                itemBuilder: (context, index) {
                  return MyBookingsListItem(state.doctorsList[index]);
                });
          }
          return const Center(
              child: SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              color: kPrimaryColour,
            ),
          ));
        },
      ),
    );
  }
}

class MyBookingsListItem extends StatelessWidget {
  final MyAppointmentsModel appointmentsModel;

  const MyBookingsListItem(this.appointmentsModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
          border: Border.all(color: kDividerColor),
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${DateTime.parse(appointmentsModel.appointmentDate ?? "").format("MMM dd, yyyy")} - ${appointmentsModel.appointmentTime}",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
            Divider(
              height: 16.h,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    appointmentsModel.imageUrl ?? "",
                    height: 80.h,
                    width: 80.w,
                    errorBuilder: (context,object,error)
                    {
                      return SizedBox(
                        width: 80.w,height: 80.h,
                          child: const Icon(Icons.broken_image_outlined));
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointmentsModel.doctorName ?? "",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black87),
                    ),
                    SizedBox(height: 4.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(Icons.location_on_rounded, color: kPrimaryBlue),
                          ),
                          TextSpan(
                            text: appointmentsModel.location ?? "",
                            style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(Icons.bookmark_added_rounded, color: kPrimaryBlue),
                          ),
                          TextSpan(
                            text: "Booking ID : ",
                            style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                          ),
                          TextSpan(
                            text: "#${appointmentsModel.bookingId}",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600, color: kPrimaryBlue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
            Divider(
              height: 32.h,
            ),
            Row(
              children: [
                SizedBox(width: 8.w),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryBlueBG, minimumSize: Size.fromHeight(40.h)),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kPrimaryBlue,
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Sorry cancellation is not allowed for this booking",
                            style: TextStyle(fontSize: 12.sp, color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryBlue, minimumSize: Size.fromHeight(40.h)),
                    child: Text(
                      "Reschedule",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Sorry rescheduling is not allowed for this booking",
                            style: TextStyle(fontSize: 12.sp, color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 8.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
