import 'package:appointmentbooking/core/utils/extensions/date_time_ext.dart';
import 'package:appointmentbooking/features/data/model/booking_confirmation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../../bloc/booking_confirmation_bloc/booking_confirmation_bloc.dart';
import '../../my_bookings/my_booking_page.dart';

class BookingConfirmationSubpage extends StatefulWidget {
  const BookingConfirmationSubpage({super.key});

  @override
  State<StatefulWidget> createState() => _BookingConfirmationSubpageState();
}

class _BookingConfirmationSubpageState extends State<BookingConfirmationSubpage> {

  @override
  void initState() {
    BlocProvider.of<GetBookingConfirmationBloc>(context).add(GetBookingConfirmationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Confirmation",
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryBlue, minimumSize: Size.fromHeight(45.h)),
              child: Text(
                "View Appointments",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                context.go("/${MyBookingsPage.id}");
              },
            ),
            SizedBox(height: 8.h,),
            TextButton(onPressed: (){
              context.go("/");
            }, child: Text(
              "Book Another",
              style: TextStyle(
                fontSize: 16.sp,
                color: kPrimaryBlue,
                fontWeight: FontWeight.w600
              ),
            ),)
          ],
        ),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<GetBookingConfirmationBloc>(context),
        builder: (context, state) {
          if (state is BookingConfirmationRetrievedSuccessfullyState) {
            return BookingConfirmationDetailsWidget(state.details);
          }
          return const Center(child: SizedBox(width: 25,height: 25,child: CircularProgressIndicator(color: kPrimaryColour,),));
        },
      ),
    );
  }
}

class BookingConfirmationDetailsWidget extends StatelessWidget{
  final BookingConfirmationModel bookingDetails;
  const BookingConfirmationDetailsWidget(this.bookingDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(right: 16.w,left: 16.w,bottom: 100.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle,size: 100.w,color: kPrimaryBlue,),
            SizedBox(height: 16.h),
            Text(
              "Appointment Confirmed!",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "You have successfully booked appointment with",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black54,
              ),
            ),
            Text(
              bookingDetails.doctorName??"",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                const Icon(Icons.person,color: kPrimaryBlue,),
                SizedBox(width: 8.w),
                Text("Esther Howard",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h,),
            Row(
              children: [
                Flexible(
                    child: Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined,color: kPrimaryBlue,),
                    SizedBox(width: 8.w),
                    Flexible(
                      child: Text(DateTime.parse(bookingDetails.appointmentDate??"").format("dd MMM, yyyy"),
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                )),
                Flexible(child: Row(
                  children: [
                    const Icon(Icons.timer,color: kPrimaryBlue,),
                    SizedBox(width: 8.w),
                    Flexible(
                      child: Text(bookingDetails.appointmentTime??"",
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            )
          ],
        ),
      ),
    );
  }

}
