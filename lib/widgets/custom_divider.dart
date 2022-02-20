import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      margin: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(color: Colors.grey.shade300),
    );
  }
}
