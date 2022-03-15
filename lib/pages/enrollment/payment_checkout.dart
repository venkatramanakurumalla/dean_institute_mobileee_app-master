import 'package:dean_institute_mobile_app/pages/payment-two.dart';
import 'package:dean_institute_mobile_app/utility/constants.dart';
import 'package:dean_institute_mobile_app/widgets/custom_divider.dart';
import 'package:dean_institute_mobile_app/widgets/custom_row_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:get/get.dart";

import '../payment.dart';
class Cheack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentCheckout(),
    );
  } 
}
class PaymentCheckout extends StatelessWidget {
//  const PaymentCheckout({Key? key}) : super(key: key);

  @override
  var price=Get.arguments[0];
   var co=Get.arguments[1];
  Widget build(BuildContext context) {
     return Scaffold(
      // body: 
       appBar:
        AppBar(
 backgroundColor: Color(0xFF932020),
 title:Text("payment Checkout",textAlign: TextAlign.center),
       ),
  //  return
  body:
  SingleChildScrollView(
 // var k=Get.arguments[0];
child:
  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      
      child:
      
       Column(
       children: [
          CustomRowTile(
              leading: Text(
               " Price",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: textColor,
                ),
              ),
              trailing: Text(
                "\$"+price,
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
                "\$0",
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
                "\$"+price,
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
         // OutlinedButton(
          //  onPressed: () {},
          //  style: OutlinedButton.styleFrom(
            //  minimumSize: Size(double.infinity, 48.h),
           // ),
           // child: Image.asset(
            //  "assets/images/paypal_logo.png",
            //  height: 24.h,
           // ),
         // ),
          SizedBox(
            height: 20.h,
          ),
          OutlinedButton(
            onPressed: () {
            Get.to(RegistePage2(),arguments:[price,co],);
            },
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
    )));
  }
}
