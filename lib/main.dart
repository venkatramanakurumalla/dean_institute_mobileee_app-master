import 'dart:io';

import 'package:dean_institute_mobile_app/pages/category_select_page.dart';
import 'package:dean_institute_mobile_app/pages/enrollment_details_page.dart';
import 'package:dean_institute_mobile_app/pages/home_page.dart';
import 'package:dean_institute_mobile_app/pages/profile_pages/payment_history.dart';
import 'package:dean_institute_mobile_app/pages/profile_pages/payment_methods.dart';
import 'package:dean_institute_mobile_app/pages/profile_pages/update_profile.dart';
import 'package:dean_institute_mobile_app/pages/sign_up_page.dart';
import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'package:dean_institute_mobile_app/ui/auth/login/login_page_binding.dart';
import 'package:dean_institute_mobile_app/ui/splash/welcome_page.dart';
import 'package:dean_institute_mobile_app/ui/splash/welcome_page_binding.dart';
import 'package:dean_institute_mobile_app/utility/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
void main() async{

  await GetStorage.init();
   runApp(HomePage(),); // Wrap your app
  //);
   
   

 

}

//checking some git functions
  
//class MyApp extends StatelessWidget {
  class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   bool isConnected=true;

  // This function is triggered when the floating button is pressed
  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      if (response.isNotEmpty) {
        print("www");
         final snackBar = SnackBar(
            content: Text("your'e Offline"),
          );
        setState(() {
         isConnected = true;
        });
      }
    } on SocketException catch (err) {
       // Get.to(HomePage());
        
       final snackBar = SnackBar(
            content: Text("your'e Offline"),
          );
      setState(() {
        isConnected = false;
      });
      print(err);
    }
  }

   @override
  void initState() {
    _checkInternetConnection();
 super.initState();
  }
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 720),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dean Institute',
        theme: ThemeData(
          primarySwatch: Palette.palette,
        ),
        getPages: [
          GetPage(
            name: "/landing",
            page: () => WelcomePage(),
            binding: WelcomePageBinding(),
          ),
          GetPage(
            name: "/login",
            page: () => LoginPage(),
            binding: LoginPageBinding(),
          ),
          GetPage(
            name: "/signUp",
            page: () =>RegisterPage() //SignUpPage(),

          ),
          GetPage(
            name: "/",
            page: () => HomePage(),
          ),
          GetPage(
            name: "/choice",
            page: () => CategorySelector(),
          ),
          GetPage(
            name: "/enroll",
            page: () => EnrollmentDetails(),
          ),
          GetPage(
            name: "/user/update",
            page: () => UpdateProfile(),
          ),
          GetPage(
            name: "/user/payment_methods",
            page: () => PaymentMethods(),
          ),
          GetPage(
            name: "/user/payment_history",
            page: () => PaymentHistory(),
          ),
          //GetPage(name: "/", page: () => ,),
        ],
        initialRoute: "/landing",
      ),
    );
  }
}
