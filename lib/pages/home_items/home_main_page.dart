import 'package:dean_institute_mobile_app/pages/home_items/sample_data.dart';
import 'package:dean_institute_mobile_app/widgets/course_list_item.dart';
import 'package:dean_institute_mobile_app/widgets/dynamic_tabs.dart';
import 'package:dean_institute_mobile_app/widgets/home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      appBar: AppBar(
        leading: Container(),
        toolbarHeight: 163.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        )),
        flexibleSpace: HomePageAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DynamicTabs(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Courses",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 200.h,
                  child: CourseListView(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "High School Diploma",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 200.h,
                  child: CourseListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseListView extends StatelessWidget {
  CourseListView({Key? key}) : super(key: key);
  final SampleData sampleData = SampleData();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: sampleData.sampleCourses.length,
      itemBuilder: (context, position) {
        return CourseListItem(sampleData.sampleCourses[position]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 8.w,
        );
      },
    );
  }
}
