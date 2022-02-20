import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dean_institute_mobile_app/utility/constants.dart' as constants;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurCardContainer extends StatelessWidget {
  final String imagePath;
  final String tileText;
  const BlurCardContainer(
      {Key? key, required this.imagePath, required this.tileText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              width: 135.5.w,
              height: 50.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                color: Colors.white.withOpacity(0.5),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      child: Center(

                        child: SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(8.r)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 7.w),
                              child: SizedBox(
                                width: 19.23.w,
                                height: 19.23.w,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(imagePath),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.h, bottom: 12.h, right: 8.w),
                      child: Container(
                        child: Text(tileText, style: GoogleFonts.poppins(
                          color: constants.blur_card_container_text_color,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                        ),),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}