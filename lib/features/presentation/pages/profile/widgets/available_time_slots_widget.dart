import 'package:appointmentbooking/core/constants/color_constants.dart';
import 'package:appointmentbooking/core/utils/extensions/date_time_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TimeSlotsWidget extends StatefulWidget {
  final List<dynamic> slotsList;
  final String date;
  final Function(DateTime? selectedTime) selectedTimeSlot;

  const TimeSlotsWidget({super.key, required this.date, required this.slotsList,required this.selectedTimeSlot});

  @override
  State<StatefulWidget> createState() => _TimeSlotsState();
}

class _TimeSlotsState extends State<TimeSlotsWidget> {
  List<DateTime> availableDateTimeList = [];
  int? _value;

  void setTimeSlots() {
    widget.selectedTimeSlot(null);
    _value=null;
    availableDateTimeList.clear();
    for (var element in widget.slotsList) {
      List<String> s = element.split("-");
      final DateFormat dateFormat = DateFormat("yyyy-MM-dd h:mm a");
      DateTime startTime = dateFormat.parse('${widget.date} ${s[0].trim()}');
      DateTime endTime = dateFormat.parse('${widget.date} ${s[1].trim()}');

      while (startTime.isBefore(endTime)) {
        availableDateTimeList.add(startTime);
        startTime = startTime.add(const Duration(minutes: 30));
        debugPrint('Adding time : $startTime');
      }
    }
  }

  @override
  void didUpdateWidget(covariant TimeSlotsWidget oldWidget) {
    setState(() {
      setTimeSlots();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    setTimeSlots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (availableDateTimeList.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Text("No slots available",
        style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.red),
    ),
      );
    } else {
      return SizedBox(
      height: 70.h,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List<Widget>.generate(
          availableDateTimeList.length,
          (int index) {
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: ChipTheme(
                data: const ChipThemeData(checkmarkColor: Colors.white),
                child: ChoiceChip(
                  label: Text(
                    availableDateTimeList[index].format("h mm a"),
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: _value == index ? Colors.white : Colors.black),
                  ),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    if(selected)widget.selectedTimeSlot(availableDateTimeList[index]);
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                  side: const BorderSide(color: Colors.grey),
                  selectedColor: kPrimaryBlue,
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.r))),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
    }
  }
}
