import 'package:dean_institute_mobile_app/utility/app_palette.dart';
import 'package:dean_institute_mobile_app/widgets/custom_top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MyCourses extends StatelessWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomTopAppBar(
            title: "My Courses",
            trailing: Icon(Icons.search),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "Here are your enrolled course, bootcamps",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, position) {
                return MyCourseItem();
              },
            ),
          )
        ],
      ),
    );
  }
}

class MyCourseItem extends StatelessWidget {
  const MyCourseItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 180.h,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset("assets/images/main_bg.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 320.w,
              height: 60.h,
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              color: Colors.black.withAlpha(160),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Course name",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "78%",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 72,
                      size: 8,
                      padding: 0,
                      selectedColor: Palette.palette,
                      unselectedColor: Colors.grey.shade400,
                      roundedEdges: Radius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
