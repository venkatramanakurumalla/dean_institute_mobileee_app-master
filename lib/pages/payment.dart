//import 'package:dean_institute_mobile_app/pages/cloud/cloud1.dart';
import 'package:dean_institute_mobile_app/pages/thnkyou.dart';
import 'package:dean_institute_mobile_app/utility/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
//import 'thanku_page.dart';

//class SignUpPage extends StatefulWidget {
class RegistePage extends StatefulWidget {
  @override
  _RegistePageState createState() => _RegistePageState();
}

class _RegistePageState extends State<RegistePage> {
 
  var van=Get.arguments[0];
//SharedPreferences prefs = await SharedPreferences.getInstance();
 // var user_id = prefs.getInt('id');
   
  
  var user_id;

//const SignUpPage({Key? key}) : super(key: key);
 
// bool _isLoading = false;
  var errorMsg;
  String StripeToken='pk_test_51JPqrYSBtCOIyCFtizgVpjDQAibCuY983h4MYUGwrWRALR9RL2j9vsuhzW279LVCjfx8Aqt5cpPuUWcGeTaBqxSH00mRBRc4ax';
 //static String user_id='1';
String latitude='yes';
String longitude='yes';

  String ip='1212';
  static TextEditingController card_numberController = new TextEditingController();
static TextEditingController exp_monthController= new TextEditingController();
  static TextEditingController exp_yearController = new TextEditingController();
  static TextEditingController cvcController = new TextEditingController();
static TextEditingController amountController = new TextEditingController();
  static TextEditingController country_codeController = new TextEditingController();
  static TextEditingController country_nameController = new TextEditingController();
static TextEditingController cityController = new TextEditingController();
  static TextEditingController postalController = new TextEditingController();
  static TextEditingController latitudeController = new TextEditingController();
static TextEditingController longitudeController = new TextEditingController();
  static TextEditingController stateController = new TextEditingController();
 // Register(card_numberController.text,exp_monthController.text, exp_yearController .text,cvcController.text,amountController.text,country_codeController.text,
 // country_nameController.text,cityController.text,postalController.text,stateController.text);
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credit/Dbit Card"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
        elevation: 0.00,
        //backgroundColor: Colors.greenAccent[400],
        backgroundColor: Colors.red,
      ), 
     
      backgroundColor: Colors.white,
      
      body: SafeArea(
        
         child: 
        // Column(
          ListView(
                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     TextField(
                        //style: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
                      controller:  card_numberController,
                      decoration: InputDecoration(
                        labelText: "Card Number",
                        hintText: "4242424242424242",
                       // fillColor: Colors.blueAccent, filled: true
                        // controller: emailController,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: exp_monthController,
                      decoration: InputDecoration(
                        labelText: "Exp-Month",
                        // controller: emailController,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: exp_yearController,
                      decoration: InputDecoration(
                        labelText: "Exp-Year",
                        // controller: emailController,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: cvcController,
                      decoration: InputDecoration(
                        labelText: "cvc",
                        // controller: emailController,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    //TextField(
                      //controller: amountController,
                    //  decoration: InputDecoration(
                      //  labelText: "amount",
                        // controller: emailController,
                        //border: OutlineInputBorder(),
                     // ),
                   // ),
                    TextField(
                      controller: country_codeController ,
                      decoration: InputDecoration(
                        labelText: "Country-Code",
                        // controller: emailController,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                       controller: country_nameController,
                     // obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Country-name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                     TextField(
                       controller: cityController,
                     // obscureText: true,
                      decoration: InputDecoration(
                        labelText: "City",
                        border: OutlineInputBorder(),
                      ),
                    ), TextField(
                       controller:postalController,
                       
                     // obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Postal code",
                        border: OutlineInputBorder(),
                      ),
                    ),
                     TextField(
                       controller: stateController,
                     // obscureText: true,
                      decoration: InputDecoration(
                        labelText: "State",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckBoxWithTitle(),
                        ElevatedButton(
                          onPressed: () {
                             Register(StripeToken,user_id,card_numberController.text,exp_monthController.text, exp_yearController .text,cvcController.text,van,country_codeController.text,
  country_nameController.text,cityController.text,postalController.text,latitude,longitude,ip,stateController.text);
                            // Register(nameController.text,emailController.text, passwordController.text);
                          //  Register(nameController.text,emailController.text, passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  left: 30.w,
                                  right: 30.w,
                                  top: 16.w,
                                  bottom: 16.w)),
                          child: Text(
                            "pay",
                            style: GoogleFonts.lato(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                      
              
                         
                        ),
                      
                    );




            //  ),
          //  ),
           
         // ],
      //  ),
     // ),
   // );
  }
}
  
   Register(String StripeToken,user_id,card,month,year,cvc,amount,countrycode,countryname,city,postal,latitude,longitude,ip,state) async {
       bool _isLoading = false;
  var errorMsg;
  
    
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user_id = prefs.getInt('id');
  
//String StripeToken='pk_test_51JPqrYSBtCOIyCFtizgVpjDQAibCuY983h4MYUGwrWRALR9RL2j9vsuhzW279LVCjfx8Aqt5cpPuUWcGeTaBqxSH00mRBRc4ax';
//id=1;
String latitude='yes';
String longitude='yes';
 // double ip=1212;
   Map data = {
      'user_id':user_id.toString(),
     'StripeToken':StripeToken,
     'card_number':card,
     'exp_month':month,
     'exp_year':year,
     'cvc':cvc,
     'amount':amount,
     'country_code':countrycode,
     'country_name':countryname,
     'city':city,
     'postal':postal,
     'latitude':latitude,
     'longitude':longitude,


     'IPv4':ip,
     'state':state,

     
    };
     var userid=data.containsValue(user_id);
   
    var jsonResponse = null;
    var token;  //
   // var response = await http.post(Uri.parse('https://deaninstitute.fastrider.co/api/registration'),headers: {"Accept": "application/json"}, body: data);
    //var response = await http.post("https://reqres.in/api/register", body: data);
    var response = await http.post(Uri.parse('https://www.flutter.fastrider.co/api/payment-by-stripe'),headers: {"Accept": "application/json"}, body: data);
  //https://www.flutter.fastrider.co/api/payment-by-stripe
    if(response.statusCode == 200) {
      Get.to(LoginPage());
      Get.snackbar("Sucess", "payment Sucess");
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if(jsonResponse != null) {
        Center(
         child: CircularProgressIndicator());
      // setState(() {
         // _isLoading = false;
       // });
       //sharedPreferences.setString("email", jsonResponse['email']);
        Get.offAll(ThankYouPage());
      //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainPage()), (Route<dynamic> route) => false);
      }
    }
    else {
    //  setState(() {
       // _isLoading = false;
    //  });
      errorMsg = response.body;
      print("The error message is: ${response.body}");
    }
  }

class CheckBoxWithTitle extends StatefulWidget {
  static var user_id;
  const CheckBoxWithTitle({
    Key? key,
  }) : super(key: key);

  @override
  _CheckBoxWithTitleState createState() => _CheckBoxWithTitleState();
}

class _CheckBoxWithTitleState extends State<CheckBoxWithTitle> {
  static var user_id;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: (v) {
            setState(() {
              value = !value;
            });
            print(value);
          },
        ),
        //Text(
         // "Agree to Terms and Policies",
         // style: GoogleFonts.lato(fontSize: 12.sp, color: Palette.palette),
        //),
      ],
    );
  
  
  }
  
  
}
//class USER{
  //static var user_id;
//}