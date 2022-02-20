import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Update Profile",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 16.sp, letterSpacing: 1.2),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 107.w,
                  width: 107.w,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ClipOval(
                          child: Image.network(
                            "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Z2lybCUyMHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
                            width: 107.w,
                            height: 107.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () {},
                          mini: true,
                          child: Icon(Icons.camera_alt_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextFormField(
                initialValue: "Sara Johnson",
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 28.h),
              TextFormField(
                initialValue: "Guest",
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 28.h),
              TextFormField(
                initialValue: "sarame@gmail.com",
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 28.h),
              TextFormField(
                initialValue: "+103, 0803, 3083",
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 28.h),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
