import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultNoLabelTextForm extends StatelessWidget {
  const DefaultNoLabelTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 13.h, horizontal: 20.w),
          border: OutlineInputBorder(),
          labelStyle:
              GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14.sp)),
    );
  }
}
