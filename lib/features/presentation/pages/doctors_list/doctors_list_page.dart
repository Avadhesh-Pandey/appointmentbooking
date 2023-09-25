import 'package:appointmentbooking/core/di/injection_getit.dart';
import 'package:appointmentbooking/features/presentation/bloc/doctors_profile_bloc/doctors_profile_bloc.dart';
import 'package:appointmentbooking/features/presentation/pages/doctors_list/subpages/doctors_list_subpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsListPage extends StatelessWidget{
  const DoctorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetDoctorsProfileBloc>(),
      child: const DoctorsListSubpage(),
    );
  }

}