import 'package:dean_institute_mobile_app/data/models/sample_course_model.dart';
import 'package:dean_institute_mobile_app/utility/app_palette.dart';
import 'package:dean_institute_mobile_app/utility/constants.dart';
import 'package:dean_institute_mobile_app/widgets/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseDetails extends StatelessWidget {
  final SampleCourseModel courseModel;
  const CourseDetails({Key? key, required this.courseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 360.w,
                    height: 228.h,
                    color: Colors.red,
                    child: Stack(children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(courseModel.courseImage),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 42.w,
                          width: 42.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(48.r),
                            ),
                          ),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Palette.palette,
                          ),
                        ),
                      )
                    ]),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    width: double.infinity,
                    child: Text(
                      courseModel.courseTitle,
                      style: GoogleFonts.lato(
                        fontSize: 20.sp,
                        color: textColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    width: double.infinity,
                    child: Text(
                      courseModel.courseAuthor,
                      style: GoogleFonts.lato(
                        fontSize: 12.sp,
                        fontStyle: FontStyle.italic,
                        color: subTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBarIndicator(
                            rating: courseModel.rating,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 16.w,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            courseModel.rating.toStringAsFixed(1),
                            style: GoogleFonts.lato(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: textColor,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "\$${courseModel.price.toStringAsFixed(2)}",
                            style: GoogleFonts.lato(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w900,
                              color: textColor,
                            ),
                          ),
                        ],
                      )),
                  //Course Details
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    width: double.infinity,
                    child: Text(
                      courseModel.courseDescription,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                        fontSize: 14.sp,
                        color: textColor,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                    width: double.infinity,
                    height: 1.w,
                    color: subTextColor.withAlpha(100),
                  ),
                  CourseInfoData(courseModel: courseModel),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                    width: double.infinity,
                    height: 1.w,
                    color: subTextColor.withAlpha(100),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Curriculum",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: textColor,
                      ),
                    ),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      shrinkWrap: true,
                      itemBuilder: (context, position) {
                        var textStyle = GoogleFonts.lato(
                          fontSize: 14.sp,
                          color: textColor,
                          fontWeight: FontWeight.w400,
                        );
                        return ListTile(
                          leading: Text(
                            position.toString(),
                            style: textStyle,
                          ),
                          title: Text(
                            "Hello World",
                            style: textStyle,
                          ),
                          trailing: Text(
                            "10:25:00",
                            style: textStyle,
                          ),
                        );
                      }),
                  Container(
                    height: 100.h,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Align(
                alignment: Alignment.topLeft,
                child: AppIconButton(
                  iconData: Icons.arrow_back,
                  onButtonTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Palette.palette,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      _showAlert(context, () {
                        Get.toNamed("enroll", arguments: courseModel);
                      });
                    },
                    child: Center(
                      child: Text(
                        "Enroll",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context, onTap()) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                CustomDialogHeader(title: "Your Details"),
                Text(
                  "Email",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700, fontSize: 10.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F1F1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    textAlignVertical: TextAlignVertical.center,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: textColor,
                    ),
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 14.h),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintStyle: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: 8.sp,
                          color: subTextColor,
                        ),
                        hintText: "Eg: sarame@gmail.com"),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  "Phone Number",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700, fontSize: 10.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F1F1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    textAlignVertical: TextAlignVertical.center,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: textColor,
                    ),
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 14.h),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintStyle: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: 8.sp,
                          color: subTextColor,
                        ),
                        hintText: "Eg: sarame@gmail.com"),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  onPressed: onTap,
                  child: Text(
                    "Let's Start",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 10.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomDialogHeader extends StatelessWidget {
  final String title;
  const CustomDialogHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Row(
            children: [
              Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(CupertinoIcons.multiply),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 4.h),
          width: double.infinity,
          height: 2,
          color: Color(0xFFEAEAEA),
        ),
      ],
    );
  }
}

class CourseInfoData extends StatelessWidget {
  const CourseInfoData({Key? key, required this.courseModel}) : super(key: key);
  final SampleCourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  child: CourseInfoItem(
                    header: "Language",
                    body: "English",
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  child: CourseInfoItem(
                    header: "Teacher",
                    body: courseModel.courseAuthor,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  child: CourseInfoItem(
                    header: "Duration",
                    body: "${courseModel.length.toStringAsFixed(2)} hrs",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  child: CourseInfoItem(
                    header: "Genre",
                    body: "IT",
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  child: CourseInfoItem(
                    header: "Students",
                    body: "220K",
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  child: CourseInfoItem(
                    header: "Released",
                    body: "8th Aug, 2021",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseInfoItem extends StatelessWidget {
  final String header, body;
  const CourseInfoItem({Key? key, required this.header, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            header,
            style: GoogleFonts.lato(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: subTextColor),
          ),
        ),
        Expanded(
          child: Text(
            body,
            style: GoogleFonts.lato(
                fontSize: 14.sp, fontWeight: FontWeight.w600, color: textColor),
          ),
        ),
      ],
    );
  }
}
