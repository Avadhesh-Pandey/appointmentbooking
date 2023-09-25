import 'package:appointmentbooking/core/di/injection_getit.dart';
import 'package:appointmentbooking/core/params/booking_detail_params.dart';
import 'package:appointmentbooking/features/presentation/bloc/doctors_profile_bloc/doctors_profile_bloc.dart';
import 'package:appointmentbooking/features/presentation/pages/doctors_list/subpages/doctors_list_subpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/appointment_options_bloc/appointment_options_bloc.dart';
import 'subpages/select_package_subpage.dart';

class SelectPackagePage extends StatelessWidget{
  static const id = "select_package";
  final BookingDetailParams bookingParams;
  const SelectPackagePage(this.bookingParams, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetAppointmentOptionsBloc>(),
      child:  SelectPackageSubpage(bookingParams),
    );
  }

}