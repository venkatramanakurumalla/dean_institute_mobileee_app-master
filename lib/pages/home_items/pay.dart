//import 'package:dean_institute_mobile_app/pages/home_items/pui.dart';
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
//import '../pym.dart';
//import '../thanku_page.dart';
LoginPage c = Get.put(LoginPage());
 final controller = Get.put(LoginPage());


class PaymentScreen extends StatefulWidget {
   var amount= Get.arguments[1];
    var  a=Get.arguments[1];
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
      body: //Center(
        Column(  
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
          children:<Widget>[  
            Container(  
              margin: EdgeInsets.all(20.0),  
              padding: EdgeInsets.all(12.0),  
              decoration:BoxDecoration(  
                  //borderRadius:BorderRadius.circular(1),  
                //  color:Colors.blue
              ),  


               child:TextButton(
          onPressed: () {
          // payNow1();
          },
          child:Image.network('https://deaninstitute.fastrider.co//'+Get.arguments[0]),

          ),
              
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
 
 onPressed: () =>Get.to( select_batch(),arguments:[Get.arguments[1]])),
//onPressed: () =>Get.to( RegistePage()) ),
//onPressed: () =>Get.to( SignUpScreen()) ),
//onPressed: () =>Get.to(registerPage1())),
//
//onPressed:()=>Get.offAll(RegistePage()),
//onPressed:()=>Get.to(RegistePage(),arguments:Get.arguments[1]),

        
     ) ] ));
 }
}