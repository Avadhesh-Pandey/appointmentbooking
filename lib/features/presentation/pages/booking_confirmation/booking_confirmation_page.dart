import 'package:appointmentbooking/core/di/injection_getit.dart';
import 'package:appointmentbooking/features/presentation/bloc/booking_confirmation_bloc/booking_confirmation_bloc.dart';
import 'package:appointmentbooking/features/presentation/pages/booking_confirmation/subpage/booking_confirmation_subpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingConfirmationPage extends StatelessWidget{
  static const id = "booking_confirmation";

  const BookingConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetBookingConfirmationBloc>(),
      child: const BookingConfirmationSubpage(),
    );
  }

}