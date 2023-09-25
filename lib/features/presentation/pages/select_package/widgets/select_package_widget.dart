import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/color_constants.dart';

class SelectPackageWidget extends StatefulWidget {
  final List<String> packagesList;
  final Function(String package) onPackageSelected;

  const SelectPackageWidget(this.packagesList, {super.key,required this.onPackageSelected});

  @override
  State<SelectPackageWidget> createState() => _SelectPackageWidgetState();
}

class _SelectPackageWidgetState extends State<SelectPackageWidget> {
  String? _selectedValue = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.packagesList.map((e) {
        return Card(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.white,
          elevation: 4,
          color: Colors.white,
          child: Row(children: [
            SizedBox(width: 8.w,),
            getPrefixIcon(e),
            Expanded(
              child: RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                value: e,
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  widget.onPackageSelected(value??"");
                  setState(() {
                    _selectedValue = value;
                  });
                },
                title: Text(e,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,color: Colors.black),),
                subtitle: Text("Subtitle $e",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,color: Colors.black54),),
              ),
            ),
          ],)
        );
      }).toList(),
    );
  }

  Widget getPrefixIcon(String e)
  {
    switch(e)
        {
      case "Messaging":
        return
          const ClipOval(
              child: Material(
                color: kPrimaryBlueBG,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.message,
                    color: kPrimaryBlue,
                    size: 20,
                  ),
                ),
              ));
      case "Voice Call":
        return const ClipOval(
            child: Material(
              color: kPrimaryBlueBG,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.call,
                  color: kPrimaryBlue,
                  size: 20,
                ),
              ),
            ));
        case "Video Call":
          return const ClipOval(
              child: Material(
                color: kPrimaryBlueBG,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.video_call,
                    color: kPrimaryBlue,
                    size: 20,
                  ),
                ),
              ));
      default:
        return const ClipOval(
            child: Material(
              color: kPrimaryBlueBG,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.person,
                  color: kPrimaryBlue,
                  size: 20,
                ),
              ),
            ));
    }
  }
}
