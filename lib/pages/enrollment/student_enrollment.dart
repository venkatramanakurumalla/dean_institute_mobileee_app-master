import 'package:dean_institute_mobile_app/utility/constants.dart';
import 'package:dean_institute_mobile_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentEnrollment extends StatelessWidget {
  const StudentEnrollment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            //padding: EdgeInsets.only(bottom: 20.w),
            child: Text(
              "Student Enrollment Agreement",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                color: textColor,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            margin: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(color: Colors.grey.shade300),
          ),
          Container(
            width: double.infinity,
            child: Text(
              "Student information".toUpperCase(),
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: textColor,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            margin: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(color: Colors.grey.shade300),
          ),
          InputField(data: "Student Name"),
          InputField(data: "Address"),
          InputField(data: "City / State / Zip Code"),
          InputField(data: "Phone Number"),
          InputField(data: "Email Address"),
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String data;
  const InputField({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: GoogleFonts.lato(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          DefaultNoLabelTextForm(),
          SizedBox(
            height: 6.h,
          )
        ],
      ),
    );
  }
}
