import 'package:dean_institute_mobile_app/utility/app_palette.dart';
import 'package:dean_institute_mobile_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class EnrollmentHeader extends StatefulWidget {
  final int step;
  final String title;
  final String subTitle;
  EnrollmentHeader(
      {Key? key,
      required this.step,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  _EnrollmentHeaderState createState() => _EnrollmentHeaderState();
}

class _EnrollmentHeaderState extends State<EnrollmentHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              child: CircularStepProgressIndicator(
                totalSteps: 4,
                currentStep: widget.step,
                stepSize: 6,
                selectedColor: Palette.palette,
                unselectedColor: Colors.grey[200],
                padding: 0,
                width: 80.w,
                height: 80.w,
                selectedStepSize: 8,
                roundedCap: (_, __) => true,
                child: Center(child: Text("${widget.step} of 4")),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 80.w,
                width: 240.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.lato(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                          color: textColor),
                    ),
                    Text(
                      widget.subTitle,
                      style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: subTextColor),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 32.h),
        Container(
          height: 1.5,
          width: double.infinity,
          color: Colors.grey.shade300,
        )
      ],
    );
  }
}
