//import 'package:dean_institute_mobile_app/pages/home_items/pui.dart';
import 'package:dean_institute_mobile_app/pages/enrollment/enrollment_form.dart';
import 'package:dean_institute_mobile_app/pages/home_items/selectbatch.dart';
import 'package:dean_institute_mobile_app/pages/sign_up_page.dart';
import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'package:flutter/material.dart';
//import 'package:flui/payment.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/payment.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:pushable_button/pushable_button.dart';
import '../payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
//import '../pym.dart';
//import '../thanku_page.dart';
LoginPage c = Get.put(LoginPage());
 final controller = Get.put(LoginPage());


class PaymentScreen extends StatefulWidget {
   var amount= Get.arguments[1];
    var  a=Get.arguments[1];
    var  d=Get.arguments[2];

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // StripeServices.init();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       //Center(
         SingleChildScrollView(
      child:  Column(  
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
          children:<Widget>[  

















            // InstituteInfoLogo(),
          Container(
            width: double.infinity,
            height: 1,
            margin: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(color: Colors.grey.shade300),
          ),

             Image.network('https://deaninstitute.fastrider.co//'+Get.arguments[0]),

             Container(
            margin: EdgeInsets.only(top: 8.h),
            width: double.infinity,

            child: Text(
              "150-49 Hillside Avenue, Queens, NY 11432-3319. Office: 212-600-9999. Email: info@deanny.org",
              style: GoogleFonts.lato(fontSize: 12.sp),
            ),
          ),

           Text(
            AgreementForm("John Doe").contents(),
            style: GoogleFonts.lato(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                height: 1.5),
          ),

            Container(  
              margin: EdgeInsets.all(20.0),  
              padding: EdgeInsets.all(12.0),  
              decoration:BoxDecoration(  
                  //borderRadius:BorderRadius.circular(1),  
                //  color:Colors.blue
              ),  


              // child:TextButton(
          //onPressed: () {
        //  // payNow1();
        //  },
         // child:Image.network('https://deaninstitute.fastrider.co//'+Get.arguments[0]),

        //  ),
              
             // child: Text("React.js",style: TextStyle(color:Colors.yellowAccent,fontSize:20),),  
            ),  
            Container(  
              margin: EdgeInsets.all(20.0),  
             // padding: EdgeInsets.all(12.0),  
              decoration:BoxDecoration(  
                //  borderRadius:BorderRadius.circular(1),  
                //  color:Colors.blue  
              ),

          

             
         child:     PushableButton(
 // child: Text('PAY NOW 😎'+Get.arguments[1]),
 //a=Get.arguments[1];
  child: Text('Batch Select Now 😎'),
  height: 60,
  elevation: 8,
  hslColor: HSLColor.fromAHSL(1.0, 195, 1.0, 0.43),//(1.0, 120, 1.0, 0.37),
  shadow: BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, 2),
  ),
 
 onPressed: () =>Get.to( select_batch(),arguments:[Get.arguments[1],Get.arguments[2]])),
//onPressed: () =>Get.to( RegistePage()) ),
//onPressed: () =>Get.to( SignUpScreen()) ),
//onPressed: () =>Get.to(registerPage1())),
//
//onPressed:()=>Get.offAll(RegistePage()),
//onPressed:()=>Get.to(RegistePage(),arguments:Get.arguments[1]),

        
     ) ] )));
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
