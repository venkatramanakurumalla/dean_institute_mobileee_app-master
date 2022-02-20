import 'package:dean_institute_mobile_app/utility/constants.dart';
import 'package:dean_institute_mobile_app/widgets/custom_divider.dart';
import 'package:dean_institute_mobile_app/widgets/custom_row_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCheckout extends StatelessWidget {
  const PaymentCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          CustomRowTile(
              leading: Text(
                "Price",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: textColor,
                ),
              ),
              trailing: Text(
                "\$340",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: textColor,
                ),
              )),
          CustomDivider(),
          CustomRowTile(
              leading: Text(
                "Discount",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: textColor,
                ),
              ),
              trailing: Text(
                "\$120",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: textColor,
                ),
              )),
          CustomDivider(),
          CustomRowTile(
              leading: Text(
                "Net Price",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: textColor,
                ),
              ),
              trailing: Text(
                "\$220",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: Colors.red,
                ),
              )),
          CustomDivider(),
          Container(
            width: double.infinity,
            child: Text(
              "Choose Payment Method",
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity, 48.h),
            ),
            child: Image.asset(
              "assets/images/heartland_logo.png",
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity, 48.h),
            ),
            child: Image.asset(
              "assets/images/paypal_logo.png",
              height: 24.h,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity, 48.h),
            ),
            child: Image.asset(
              "assets/images/stripe_logo.png",
              height: 24.h,
            ),
          ),
        ],
      ),
    );
  }
}
