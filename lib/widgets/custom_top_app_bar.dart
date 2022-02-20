import 'package:dean_institute_mobile_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTopAppBar extends StatelessWidget {
  final String title;
  final Widget trailing;
  final EdgeInsets? padding;
  CustomTopAppBar(
      {Key? key, required this.title, required this.trailing, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: padding == null
          ? EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w, bottom: 26.h)
          : padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 25.sp,
              color: textColor,
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
