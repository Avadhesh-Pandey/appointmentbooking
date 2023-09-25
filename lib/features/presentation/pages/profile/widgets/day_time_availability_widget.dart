import 'package:appointmentbooking/core/constants/color_constants.dart';
import 'package:appointmentbooking/core/utils/extensions/date_time_ext.dart';
import 'package:appointmentbooking/features/presentation/pages/profile/widgets/available_time_slots_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayTimeAvailabilityWidget extends StatefulWidget {
  final Map<dynamic, dynamic> map;
  final Function(DateTime? selectedTime) selectedTimeSlot;

  const DayTimeAvailabilityWidget(this.map, {super.key, required this.selectedTimeSlot});

  @override
  State<StatefulWidget> createState() => _DayTimeAvailabilityWidgetState();
}

class _DayTimeAvailabilityWidgetState extends State<DayTimeAvailabilityWidget> {
  List<DateTime> availableDays = [];
  int _value = 0;

  @override
  void initState() {
    for (var element in widget.map.keys) {
      availableDays.add(DateTime.parse(element.toString()));
    }
    debugPrint("KEYS :: ${availableDays}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16.h,
        ),
        Text(
          "Day",
          style: TextStyle(fontSize: 18.sp, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 70.h,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List<Widget>.generate(
              availableDays.length,
              (int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: ChipTheme(
                    data: const ChipThemeData(checkmarkColor: Colors.white),
                    child: ChoiceChip(
                      label: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: availableDays[index].format("EEE"),
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: _value == index ? Colors.white : Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '\n${availableDays[index].format("d MMM")}',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: _value == index ? Colors.white : Colors.black),
                            ),
                          ],
                        ),
                      ),
                      selected: _value == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? index : 0;
                        });
                      },
                      side: const BorderSide(color: Colors.grey),
                      selectedColor: kPrimaryBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "Time",
          style: TextStyle(fontSize: 18.sp, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        TimeSlotsWidget(
          date: availableDays[_value].format("yyyy-MM-dd"),
          slotsList: widget.map[availableDays[_value].format("yyyy-MM-dd")] ?? [],
          selectedTimeSlot: widget.selectedTimeSlot,
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
