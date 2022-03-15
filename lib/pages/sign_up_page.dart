import 'package:dean_institute_mobile_app/utility/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//class SignUpPage extends StatefulWidget {
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  

//const SignUpPage({Key? key}) : super(key: key);
 
 bool _isLoading = false;
  var errorMsg;
  static TextEditingController nameController = new TextEditingController();
static TextEditingController emailController = new TextEditingController();
  static TextEditingController passwordController = new TextEditingController();
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(36.w),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.asset("assets/images/logo_with_text.png"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "name",
                        // controller: emailController,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        // controller: emailController,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                       controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckBoxWithTitle(),
                        ElevatedButton(
                          onPressed: () {
                             Register(nameController.text,emailController.text, passwordController.text);
                          //  Register(nameController.text,emailController.text, passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  left: 30.w,
                                  right: 30.w,
                                  top: 16.w,
                                  bottom: 16.w)),
                          child: Text(
                            "Sign Up",
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
            ),
           
          ],
        ),
      ),
    );
  }
}

   Register(String name, email, pass,) async {
       bool _isLoading = false;
  var errorMsg;
  
    
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   Map data = {
      'name':name,
      'email': email,
      'password': pass
    };
   
    var jsonResponse = null;
    var token;  
    var response = await http.post(Uri.parse('https://deaninstitute.fastrider.co/api/registration'),headers: {"Accept": "application/json"}, body: data);
    //var response = await http.post("https://reqres.in/api/register", body: data);
    if(response.statusCode == 200) {
      Get.to(LoginPage());
      Get.snackbar("Sucess", "Signup Sucess");
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if(jsonResponse != null) {
       // setState(() {
         // _isLoading = false;
       // });
       //sharedPreferences.setString("email", jsonResponse['email']);
       // Get.to(LoginPage());
      //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainPage()), (Route<dynamic> route) => false);
      }
    }
    else {
       Get.snackbar("Sucess", "Signup UnSucess+");
      // ${response.body}");
    //  setState(() {
       // _isLoading = false;
    //  });
      errorMsg = response.body;
      print("The error message is: ${response.body}");
    }
  }

class CheckBoxWithTitle extends StatefulWidget {
  const CheckBoxWithTitle({
    Key? key,
  }) : super(key: key);

  @override
  _CheckBoxWithTitleState createState() => _CheckBoxWithTitleState();
}

class _CheckBoxWithTitleState extends State<CheckBoxWithTitle> {
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
        Text(
          "Agree to Terms and Policies",
          style: GoogleFonts.lato(fontSize: 12.sp, color: Palette.palette),
        ),
      ],
    );
  
  
  }
  
}