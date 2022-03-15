import 'package:dean_institute_mobile_app/pages/changepassword.dart';
import 'package:dean_institute_mobile_app/pages/home_items/about.dart';
import 'package:dean_institute_mobile_app/pages/home_page.dart';
import 'package:dean_institute_mobile_app/pages/profile_pages/payment_history.dart';
import 'package:dean_institute_mobile_app/pages/profile_pages/update_profile.dart';
import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'package:dean_institute_mobile_app/ui/splash/welcome_page.dart';
import 'package:dean_institute_mobile_app/widgets/custom_divider.dart';
import 'package:dean_institute_mobile_app/widgets/custom_row_tile.dart';
import 'package:dean_institute_mobile_app/widgets/custom_top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
//import 'package:get/get_navigation/src/snackbar/snack.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../profile_pages/payment_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';

class Profile extends StatelessWidget {
  

   Profile({Key? key}) : super(key: key);
  final userdata = GetStorage();

   getv() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.get("email");
  //Return String
  //String? email = prefs.getString('email');
 //String value = await getValue() ?? "email";
 // String stringValue = prefs.getString('key');
 // return stringValue;
}

 // void _onLogOutPressed() {
   ///// onPressed: ()
   // async {
         //   SharedPreferences prefs = await SharedPreferences.getInstance();
          //  prefs.remove('email');
          //  Navigator.pushReplacement(context,
            //    MaterialPageRoute(builder: (BuildContext ctx) => Login()));
       //   },
   // void logoutUser(){
//SharedPreferences prefs = await SharedPreferences.getInstance();
//prefs?.clear() ;
// Navigator.pushAndRemoveUntil(
     // context, 
      //ModalRoute.withName("/SplashScreen"), 
     //ModalRoute.withName("/Home")
  //  );

   // print("Log out");
 // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 22.w, right: 22.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTopAppBar(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  title: "Profile",
                  trailing: TextButton( onPressed: () async {
                    userdata.write('isLogged', false);
                userdata.remove('email');
                 userdata.remove('body');
                    final LoginPage c = Get.put(LoginPage());
                    GetStorage box = GetStorage();
                    box.remove('email');
              c.localStorage.deleteAll();
              c.localStorage.deleteAll();
            SharedPreferences prefs = await SharedPreferences.getInstance();
             prefs.remove('email');
               
           // final LoginPage c = Get.put(LoginPage());
              c.localStorage.deleteAll();
              c.localStorage.deleteAll();
            // var K=c.localStorage.readAll().toString();
            c.localStorage.deleteAll();
          
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
           Get.snackbar(
              "Logout",
               "Bye Bye ",
               icon: Icon(Icons.person, color: Colors.white),
              // snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.red,
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
             //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
          },
                    //onPressed:
                 
                    // _onLogOutPressed,
 child: Text(
                      "Log out",
                      style: GoogleFonts.lato(
                          fontSize: 20.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                   
 
                CircleAvatar(
              radius: 50,
            backgroundColor:Colors.cyan,
        //  backgroundImage:
             // Image.asset('images/edu.png'),
              backgroundImage:AssetImage("assets/images/person.jpg"),
             
            ),
              ////Text(
                //"${userdata.read('name')}",
             // 'venkat',
            //  style: TextStyle(
               // fontSize: 40,
               // fontFamily: 'Pacifico',
               // fontStyle: FontStyle.italic,
               // fontWeight: FontWeight.bold,
               // color: Colors.teal[100]
              //  color: Colors.black,
            //  ),
            //),
             
        
            Text( //getValue(),
             "${userdata.read('email')}",
            // 'venkatandroid10@gmail.com',
              style: TextStyle(
                fontFamily: 'SourceSans',
               // color: Colors.teal[100],
               color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(
              height:20,
              width: 150,
              child: (
                  Divider(
                    color: Colors.teal.shade100,
                  )
              ),
              
              ),

             
//Card(   child: InkWell(onTap: () {Get.to(UpdateProfile());},
             // margin:
              // EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
             // child: ListTile(
              //  leading: Icon(
               //   Icons.update,
                //  color: Colors.teal,
               // ),
                   
              //  title: Text(
               //   "update profile",
               //   style: TextStyle(
                //    fontSize: 20,
                 //   fontFamily: 'SourceSans',
              
                 // ),
              //  ),
            //  ))
            //  ),
        
            Card( child: InkWell(onTap: () {Get.to(Changepassword());},
             // margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                selected: true,
                leading: Icon(
                  Icons.password,
                  color: Colors.teal,
                ),
              
                title: Text(
                  
                  "change password",
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'SourceSans',
                    fontSize: 20,
                  ),
                ),
              ),),
            ),

             Card( child: InkWell(onTap: () {Get.to(Myabout());},
             // margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                selected: true,
                leading: Icon(
                  Icons.person,
                  color: Colors.teal,
                ),
              
                title: Text(
                  
                  "about",
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'SourceSans',
                    fontSize: 20,
                  ),
                ),
              ),),
            ),
              
        ],
      ),
         ), ),));
  }}