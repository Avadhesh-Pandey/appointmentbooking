import 'package:appointmentbooking/core/constants/color_constants.dart';
import 'package:appointmentbooking/core/params/booking_detail_params.dart';
import 'package:appointmentbooking/features/data/model/appointment_option_model.dart';
import 'package:appointmentbooking/features/presentation/pages/doctors_list/widgets/doctors_list_widget.dart';
import 'package:appointmentbooking/features/presentation/pages/select_package/widgets/select_package_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/appointment_options_bloc/appointment_options_bloc.dart';
import '../../../bloc/doctors_profile_bloc/doctors_profile_bloc.dart';
import '../../review_booking/review_booking_page.dart';
import '../widgets/select_duration_widget.dart';

class SelectPackageSubpage extends StatefulWidget {
  final BookingDetailParams bookingParams;

  const SelectPackageSubpage(this.bookingParams, {super.key});

  @override
  State<StatefulWidget> createState() => _SelectPackageSubpageState();
}

class _SelectPackageSubpageState extends State<SelectPackageSubpage> {
  String? duration;
  String? package;

  @override
  void initState() {
    BlocProvider.of<GetAppointmentOptionsBloc>(context).add(GetAppointmentOptionsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Select Package",
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
            "Next",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            if (package != null) {
              widget.bookingParams.package = package;
              widget.bookingParams.duration = duration;
              context.go("/${ReviewBookingPage.id}", extra: widget.bookingParams);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Please select any package",
                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                  ),
                ),
              );
            }
          },
        ),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<GetAppointmentOptionsBloc>(context),
        builder: (context, state) {
          if (state is AppointmentOptionsRetrievedSuccessfullyState) {
            duration = state.result.duration?.first;
            return SelectPackageMainWidget(
              state.result,
              onDurationChanged: (String duration) {
                this.duration = duration;
                debugPrint("onDurationChanged:$duration");
              },
              onPackageSelected: (String package) {
                this.package = package;
                debugPrint("onPackageSelected:$package");
              },
            );
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

class SelectPackageMainWidget extends StatelessWidget {
  final AppointmentOptionsModel appointmentOptions;
  final Function(String duration) onDurationChanged;
  final Function(String package) onPackageSelected;

  const SelectPackageMainWidget(this.appointmentOptions,
      {super.key, required this.onDurationChanged, required this.onPackageSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      children: [
        Text(
          "Select Duration",
          style: TextStyle(fontSize: 18.sp, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        SelectDurationWidget(
          appointmentOptions.duration ?? [],
          onDurationChanged: onDurationChanged,
        ),
        SizedBox(height: 16.h),
        Text(
          "Select Package",
          style: TextStyle(fontSize: 18.sp, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        SelectPackageWidget(
          appointmentOptions.package ?? [],
          onPackageSelected: onPackageSelected,
        ),
      ],
    );
  }
}
