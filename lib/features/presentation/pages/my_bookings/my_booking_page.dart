import 'package:appointmentbooking/core/di/injection_getit.dart';
import 'package:appointmentbooking/features/presentation/bloc/booking_confirmation_bloc/booking_confirmation_bloc.dart';
import 'package:appointmentbooking/features/presentation/bloc/my_appointments_bloc/my_appointments_bloc.dart';
import 'package:appointmentbooking/features/presentation/pages/booking_confirmation/subpage/booking_confirmation_subpage.dart';
import 'package:appointmentbooking/features/presentation/pages/my_bookings/subpages/my_bookings_subpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBookingsPage extends StatelessWidget {
  static const id = "my_booking";

  const MyBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetMyAppointmentsBloc>(),
      child: const MyBookingSubpage(),
    );
  }
}
