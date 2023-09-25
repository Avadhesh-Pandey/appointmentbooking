import 'package:appointmentbooking/features/data/model/doctors_list_model.dart';
import 'package:appointmentbooking/features/presentation/pages/doctors_list/doctors_list_page.dart';
import 'package:appointmentbooking/features/presentation/pages/profile/doctor_profile_page.dart';
import 'package:appointmentbooking/features/presentation/pages/select_package/select_package_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/presentation/pages/booking_confirmation/booking_confirmation_page.dart';
import '../../features/presentation/pages/my_bookings/my_booking_page.dart';
import '../../features/presentation/pages/review_booking/review_booking_page.dart';
import '../params/booking_detail_params.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const DoctorsListPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: DoctorProfilePage.id,
          builder: (BuildContext context, GoRouterState state) {
            return  DoctorProfilePage(state.extra as DoctorsProfileModel);
          },
        ),
        GoRoute(
          path: SelectPackagePage.id,
          builder: (BuildContext context, GoRouterState state) {
            return  SelectPackagePage(state.extra as BookingDetailParams);
          },
        ),
        GoRoute(
          path: ReviewBookingPage.id,
          builder: (BuildContext context, GoRouterState state) {
            return  ReviewBookingPage(state.extra as BookingDetailParams);
          },
        ),
        GoRoute(
          path: BookingConfirmationPage.id,
          builder: (BuildContext context, GoRouterState state) {
            return  const BookingConfirmationPage();
          },
        ),
        GoRoute(
          path: MyBookingsPage.id,
          builder: (BuildContext context, GoRouterState state) {
            return  const MyBookingsPage();
          },
        ),
      ],
    ),
  ],
);