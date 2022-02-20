import 'package:dean_institute_mobile_app/utility/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {Key? key, required this.iconData, required this.onButtonTap})
      : super(key: key);

  final IconData iconData;
  final void Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.w,
      width: 34.w,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Palette.palette,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onButtonTap,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          child: Center(
            child: Icon(
              iconData,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({Key? key, required this.iconData, this.onButtonTap})
      : super(key: key);

  final IconData iconData;
  final void Function()? onButtonTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonTap,
      borderRadius: BorderRadius.all(Radius.circular(12.r)),
      child: Container(
        height: 40.w,
        width: 40.w,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(50),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Center(
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
