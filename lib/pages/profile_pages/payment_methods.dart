import 'package:dean_institute_mobile_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Methods",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Cards",
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)),
              leading: Image.network(
                  "https://www.oerlive.com/wp-content/uploads/2019/01/Mastercard_logo.0.jpg"),
              tileColor: Color(0xFFf4f4f4),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              title: Text(
                "Mastercard".toUpperCase(),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: subTextColor),
              ),
              subtitle: Text(
                "172** **** ****",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: textColor,
                ),
              ),
              trailing: Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                    "Valid".toUpperCase(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: subTextColor),
                  ),
                  Text(
                    "12/23",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)),
              leading:
                  Image.network("https://i.ibb.co/f486R1R/q-Zv-FDtl-Imgur.png"),
              tileColor: Color(0xFFf4f4f4),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              title: Text(
                "Payoneer".toUpperCase(),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: subTextColor),
              ),
              subtitle: Text(
                "28** **** ****",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: textColor,
                ),
              ),
              trailing: Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                    "Valid".toUpperCase(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: subTextColor),
                  ),
                  Text(
                    "07/22",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 36.h),
              child: Text(
                "Bank Accounts",
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)),
              leading: Image.network(
                  "https://www.oerlive.com/wp-content/uploads/2019/01/Mastercard_logo.0.jpg"),
              tileColor: Color(0xFFf4f4f4),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              title: Text(
                "Mastercard".toUpperCase(),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: subTextColor),
              ),
              subtitle: Text(
                "172** **** ****",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: textColor,
                ),
              ),
              trailing: Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                    "Valid".toUpperCase(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: subTextColor),
                  ),
                  Text(
                    "12/23",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
