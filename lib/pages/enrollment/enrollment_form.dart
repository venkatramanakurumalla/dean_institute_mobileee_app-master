import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EnrollmentForm extends StatelessWidget {
  const EnrollmentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InstituteInfoLogo(),
          Container(
            width: double.infinity,
            height: 1,
            margin: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(color: Colors.grey.shade300),
          ),
          Text(
            AgreementForm("John Doe").contents(),
            style: GoogleFonts.lato(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                height: 1.5),
          ),
          SizedBox(
            height: 32.h,
          )
        ],
      ),
    );
  }
}

class InstituteInfoLogo extends StatelessWidget {
  const InstituteInfoLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.h,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Image.asset("assets/images/logo_with_text.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            width: double.infinity,
            child: Text(
              "150-49 Hillside Avenue, Queens, NY 11432-3319. Office: 212-600-9999. Email: info@deanny.org",
              style: GoogleFonts.lato(fontSize: 12.sp),
            ),
          )
        ],
      ),
    );
  }
}

class AgreementForm {
  final _userName;

  AgreementForm(this._userName);

  String contents() => """
This Student Enrollment Agreement (this “Agreement”) is a binding agreement between $_userName as the “Student”, and Dean Institute, with regard to a single enrollment in an Advanced Career Training program that may consist of a single or multiple programs. This Agreement becomes binding and effective upon the Student’s acceptance, indicated by online acknowledgement of receipt of, and agreement to, the provisions of this Agreement.
The parties here to agree as follows:

1. ADMISSIONS CRITERIA: The Student shall have responsibility for review of the Program Description for the program of the Student’s choice (available at www.deanny.org), whether the Student self-enrolls or enrolls with the assistance of a Dean Institute staff member.

2. TUITION: Tuition or down payment for programs and/or courses, including any applicable taxes, must be received by Dean Institute before the Student will be registered. If the Student is unable to make a one-time full tuition payment prior to registering for a program/course, the Student may discuss options to make tuition payments and execute a written agreement with a detailed payment plan offered by Dean Institute. Tuition payments are predetermined by course type. Registration and any material fees are not refundable and not transferable. For details on the tuition payment, please see Appendix A.

3. COMPLETION REQUIREMENTS: In order to receive a Certificate of Completion, the Student must successfully complete the program by the date indicated in Dean Institute’s Student Center following the date on which the Student enrolls in the program, and tuition must be paid in full before the Student can receive a Certificate of Completion. If the Student fails to meet the minimum ninety percent (90%) attendance standard and does not complete all the assigned homework, the Student will not receive a Certificate of Completion.

4. PROGRAM CANCELLATION POLICY: The Student may request the Student's enrollment be canceled at any time before the Student is registered for and granted access to the program or the first program, if purchasing more than one program at a time.
  """;
}
