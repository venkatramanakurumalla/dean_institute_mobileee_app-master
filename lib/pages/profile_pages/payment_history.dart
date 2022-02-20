import 'package:dean_institute_mobile_app/pages/home_items/sample_data.dart';
import 'package:dean_institute_mobile_app/utility/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var payments = SampleData().paymentHistory;
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment History"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
        child: ListView.builder(
            itemBuilder: (context, position) {
              return ListTile(
                leading: Container(
                  width: 68.w,
                  height: 54.w,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(payments[position].imageUrl),
                  ),
                ),
                title: Text(
                  payments[position].courseName,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: textColor,
                  ),
                ),
                subtitle: Text(payments[position].date),
                trailing: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    Text(
                      payments[position].price.toStringAsFixed(0) + "\$",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: textColor),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      payments[position].time,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: payments.length),
      ),
    );
  }
}
