import 'package:dean_institute_mobile_app/data/models/sample_course_model.dart';
import 'package:dean_institute_mobile_app/pages/enrollment/batch_selection.dart';
import 'package:dean_institute_mobile_app/pages/enrollment/enrollment_form.dart';
import 'package:dean_institute_mobile_app/pages/enrollment/payment_checkout.dart';
import 'package:dean_institute_mobile_app/pages/enrollment/student_enrollment.dart';
import 'package:dean_institute_mobile_app/pages/home_items/sample_data.dart';
import 'package:dean_institute_mobile_app/widgets/enrollment_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EnrollmentDetails extends StatefulWidget {
  final SampleCourseModel courseModel = Get.arguments;
  EnrollmentDetails({Key? key}) : super(key: key);

  @override
  _EnrollmentDetailsState createState() => _EnrollmentDetailsState();
}

class _EnrollmentDetailsState extends State<EnrollmentDetails> {
  late int step;

  final sampleData = SampleData();
  late int selectedBatchIndex;

  @override
  void initState() {
    step = 1;
    selectedBatchIndex = 0;
    super.initState();
  }

  final _titleList = [
    "Batch Selection",
    "Student Enrollment",
    "Student Form",
    "Payment Checkout"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
                    child: EnrollmentHeader(
                      step: step,
                      title: _titleList[step - 1],
                      subTitle: step != 4 ? "Next: ${_titleList[step]}" : "",
                    ),
                  ),
                  (step == 1 || step == 4)
                      ? ListTile(
                          leading: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child:
                                Image.network(widget.courseModel.courseImage),
                          ),
                          title: Text(
                            widget.courseModel.courseTitle,
                          ),
                          subtitle: Text(selectedBatchIndex == 0
                              ? "Batch Selected: I will select later"
                              : "Batch Selected: ${sampleData.batches[selectedBatchIndex].days}"),
                        )
                      : Container(),
                  (step == 1 || step == 4)
                      ? SizedBox(
                          height: 12.h,
                        )
                      : Container(),
                  _getCurrentPage(step),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (step != 1) {
                                step--;
                              } else {
                                Navigator.pop(context);
                              }
                            });
                          },
                          child: Text(
                            "Back",
                            style: GoogleFonts.lato(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (step != 4) {
                                step++;
                              }
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 36.w, vertical: 12.h),
                            child: _getButtonText(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            /*Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (step != 1) {
                            step--;
                          } else {
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: Text(
                        "Back",
                        style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (step != 4) {
                            step++;
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 36.w, vertical: 12.h),
                        child: _getButtonText(),
                      ),
                    ),
                  ],
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }

  Widget _getButtonText() {
    String text;
    if (step == 3) {
      text = "Agree";
    } else if (step == 4) {
      text = "Pay";
    } else {
      text = "Next";
    }

    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 14.sp,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _getCurrentPage(int index) {
    if (index == 1) {
      return BatchSelection(
        courseModel: widget.courseModel,
      );
    } else if (index == 2) {
      return StudentEnrollment();
    } else if (index == 3) {
      return EnrollmentForm();
    } else if (index == 4) {
      return PaymentCheckout();
    } else
      throw Exception("Invalid page index");
  }
}
