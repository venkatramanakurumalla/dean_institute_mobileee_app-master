import 'package:dean_institute_mobile_app/data/models/sample_course_model.dart';
import 'package:dean_institute_mobile_app/pages/course_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseListItem extends StatelessWidget {
  const CourseListItem(this.sampleCourse, {Key? key}) : super(key: key);

  final SampleCourseModel sampleCourse;
  static const _textColor = Color(0xFF45445B);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185.w,
      height: 200.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: Stack(children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetails(
                    courseModel: sampleCourse,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(sampleCourse.courseImage),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Container(
                            padding: EdgeInsets.only(left: 8.w, top: 8.w),
                            width: double.infinity,
                            height: double.infinity,
                            child: Text(
                              sampleCourse.courseTitle,
                              maxLines: 2,
                              softWrap: true,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w800,
                                fontSize: 13.sp,
                                color: _textColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(top: 8.w, right: 8.w),
                              alignment: Alignment.topRight,
                              child: Text(
                                sampleCourse.length.toStringAsFixed(0) + " hrs",
                                style: GoogleFonts.lato(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700,
                                  color: _textColor,
                                ),
                              ),
                            ))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            sampleCourse.courseAuthor,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: Color(0xFFA1A1A1),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RatingBarIndicator(
                                rating: sampleCourse.rating,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 12.w,
                                direction: Axis.horizontal,
                              ),
                              Text(
                                sampleCourse.rating.toStringAsFixed(1),
                                style: GoogleFonts.lato(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: _textColor,
                                ),
                              ),
                              Text(
                                "\$${sampleCourse.price.toStringAsFixed(2)}",
                                style: GoogleFonts.lato(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w900,
                                  color: _textColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
        sampleCourse.isBestSeller
            ? Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: SvgPicture.asset("assets/svg/best_seller_badge.svg"),
                ),
              )
            : Container(),
      ]),
    );
  }
}
