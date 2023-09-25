import 'package:appointmentbooking/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDurationWidget extends StatefulWidget {
  final List<String> list;
  final Function(String duration) onDurationChanged;
  const SelectDurationWidget(this.list,{super.key,required this.onDurationChanged});

  @override
  State<SelectDurationWidget> createState() => _SelectDurationWidgetState();
}

class _SelectDurationWidgetState extends State<SelectDurationWidget> {
  String dropdownValue = "";

  @override
  void initState() {
    dropdownValue = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: widget.list.first,
      onSelected: (String? value) {
        widget.onDurationChanged(value??"");
        setState(() {
          dropdownValue = value!;
        });
      },
      textStyle: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),
      width: MediaQuery.of(context).size.width-32.w,
      leadingIcon: const Icon(Icons.access_time_filled,color: kPrimaryBlue,),
      trailingIcon: const Icon(Icons.arrow_drop_down_outlined,color: kPrimaryBlue,),
      dropdownMenuEntries: widget.list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
