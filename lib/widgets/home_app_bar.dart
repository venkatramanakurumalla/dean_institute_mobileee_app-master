
import 'package:dean_institute_mobile_app/pages/home_items/serch_two.dart';
import 'package:dean_institute_mobile_app/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:get/get.dart";

import 'icon_buttons.dart';

class HomePageAppBar extends StatelessWidget {
  

   HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Text(
                  "Explore",
                  style: GoogleFonts.poppins(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text("Call +1-518-621-0378",
                style: TextStyle(color: Colors.white),
          textDirection: TextDirection.ltr),
               // AppBarIconButton(
               //   iconData: CupertinoIcons.cart_fill,
                //  onButtonTap: () {
                //    print("Pressed Cart Button");
                //  },
              //  ),
                SizedBox(
                  width: 16,
                ),
              //  AppBarIconButton(
                 // iconData: CupertinoIcons.bell_fill,
                //  onButtonTap: () {
                //    Get.to(Jobs());
                   // print("Pressed Bell Button");
               //   },
              //  ),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Center(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Center(
                      child: TextFormField(
                        cursorColor: Colors.black,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            
                            contentPadding: EdgeInsets.only(
                                left: 15.w,
                                bottom: 11.h,
                                top: 11.h,
                                right: 15.w),
                            hintText: "Search courses, bootcamp"),onTap: () { Get.to(Jobs()); },
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
