import 'package:appointmentbooking/core/constants/color_constants.dart';
import 'package:appointmentbooking/features/presentation/pages/doctors_list/widgets/doctors_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/doctors_profile_bloc/doctors_profile_bloc.dart';

class DoctorsListSubpage extends StatefulWidget {
  const DoctorsListSubpage({super.key});

  @override
  State<StatefulWidget> createState() => _DoctorsListSubpage();
}

class _DoctorsListSubpage extends State<DoctorsListSubpage> {

  @override
  void initState() {
    BlocProvider.of<GetDoctorsProfileBloc>(context).add(GetDoctorsProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',height: 25.h,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColour,
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<GetDoctorsProfileBloc>(context),
        builder: (context, state) {
          if (state is DoctorsProfileRetrievedSuccessfullyStatus) {
            return DoctorsListWidget(state.doctorsList);
          }
          return const Center(child: SizedBox(width: 25,height: 25,child: CircularProgressIndicator(color: kPrimaryColour,),));
        },
      ),
    );
  }
}
