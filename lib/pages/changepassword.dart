import 'dart:convert';
import 'dart:io';

import 'package:dean_institute_mobile_app/ui/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Changepassword extends StatelessWidget {

 final oldpasswordcontroller = TextEditingController();
  final newpasswordcontroller = TextEditingController();
   final conformpasswordcontroller = TextEditingController();
  

  void post(){
  // r();userdata.write('isLogged', true);
                
    bool _isLoading = false;
  var errorMsg;
  Register(String oldpasswordcontroller,newpasswordcontroller,conformpasswordcontroller ) async {
    
  //  FlutterSecureStorage _localStorage = new FlutterSecureStorage();
    // await _localStorage.write(key: "email", value: "email").obs;
  //  localStorage.read(key: "email").obs;
  //  GetStorage box = GetStorage();
   // box.write('email',val(email));
   // userdata.write('isLogged', true);
            //      userdata.write('email',email );
// SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Map data = {
     "current_password":oldpasswordcontroller,
"new_password":newpasswordcontroller,
"password_confirmation":conformpasswordcontroller
  
    
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
     String? access_token = prefs.getString('access_token');
    // GetStorage box1 = GetStorage();
    //box1.write('email',email);
    var jsonResponse = null;
    // Controller c = Get.put(Controller());
   //var r=email.obs;
  // Obx(() => Text("${email}"));
  //Uri('https://reqres.in/api/register');
var response = await http.post(Uri.parse('https://deaninstitute.fastrider.co/api/update/password'), headers: {
          HttpHeaders.authorizationHeader: 'Bearer ' + access_token.toString(), }, body: data);

    //var response = await http.post(Uri.parse('https://deaninstitute.fastrider.co/api/update/password'), body: data);
    if(response.statusCode == 200) {
        Map K=  json.decode(response.body);
// var status =prefs.setBool("isLoggedIn", true);
      // print(status);
   //  Get.to(HomePage(),arguments:email);
     
    //  jsonResponse = json.decode(response.body);
     // print(jsonResponse); 
     // userdata.write("name",jsonResponse["name"]);
    // userdata.write("body",response.body);
      Get.to(LoginPage(),);
      // Map K=  json.decode(response.body);
      // final prefs = await SharedPreferences.getInstance();
    //prefs.setString(response[user[0]],K[user[0]]);
//prefs.setInt("id",K["id"]);
  //  prefs.setString("access_token",K["access_token"]);
  //var token = prefs.getString('access_token');
  
  //var id = prefs.getInt('id');

     
       //SharedPreferences prefs = await SharedPreferences.getInstance();
//var v=prefs.setString("access_token",jsonResponse["access_token"]);
//print(v);
     //// asyncFunc() async { // Async func to handle Futures easier; or use Future.then
 // SharedPreferences prefs = await SharedPreferences.getInstance();
//}

// Set
//prefs.setString('token',jsonResponse);
// Get
//String token = prefs.getString('apiToken');
// Remove
//prefs.remove('apiToken');
       //  print(jsonResponse); 
      // var  v=jsonResponse.obs;
       
     // https://www.deaninstitute.fastrider.co/api/user?access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZjk3OTQ3Y2IwODZhMTU4MWJlNzYxYzY2MTM4YzVjNGFiNGNhNWRmOGRiYjIyOTU5NDcyZTlhOWI5N2Q3ZmI2ZTQwMmM4NDhiZDkyOTAzODgiLCJpYXQiOjE2MzkyMTA5OTcuNDYyNDg4ODg5Njk0MjEzODY3MTg3NSwibmJmIjoxNjM5MjEwOTk3LjQ2MjQ5Mjk0MjgxMDA1ODU5Mzc1LCJleHAiOjE2NzA3NDY5OTcuMjEyODYyOTY4NDQ0ODI0MjE4NzUsInN1YiI6IjE3Iiwic2NvcGVzIjpbXX0.qT9smrC_BxmKKuGTBj8SUI3RDgiR2JcoCP8Yakp-kEk2OzG43E8gNGweusZE4M3u46K43Gn9YORri_GcTmSzGy1-C_LTVAVTte1FHLiZQgzkTVworijHRnBvhnOk4WL-378Qrnd55_r8dzrPbvi-7c8WG2qfHQ-Fu0u2GH3Ji7GCt9wMkRucyjQZd6QNYq_JQFZg4MKoUYuQvBsufrilqW8r8QVDKKaNWDaIG-lFANsKiah8Zdq0eFmkDbaSaFXrIueA6RiC0nCJge5UdePQQnZYorz2tfK0gUE4SeOjn8BNt-4mY4Brd-p5rpKsZDut9SiNoQpKjzI3JHiEeGQydGgnT6sily1djvy_TK-irB6LN6MREvC7zr8aqnJ6SpgDUIvdtSezCxeCfLK_WhFzDkI35_TOXveh_uhYXxJOrcThln4Wj0JKC5-th_2KIcmszQ23gBOAPlEju_HMt9llA7euow186SsvHnzLG-sK3V6UTAYJzUqkb7-MB7JXvymTCqyH0l0BNhs3ry8RFXtUe5TpBEl4UTMNzR8-A9IJUAbCqUSfd2XMcWrL9m-p-7ZgwQk6mAEl1mJKZSICPjL60TZlUbcpCPkELQdJLjYe9CVqDU303AF79HH0cYIVT10TqM_E4Tjd741-LHPN6CpYlEiP_GMbeEuribKsVUjMdRY
       // Get.snackbar("Sucess", "Login Sucess");
       Get.snackbar(
              "Password Sucessful",
               "",
               icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.red,
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
             //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
      print("sucess");
     // print(id);
     // print(token);
     // print(K[0]);
    //  print(r);
     //  print(status);
      //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
       //Get.to(HomePage());
     //if(jsonResponse != null) {
     //   setState(() {
        //  _isLoading = false;
      // });
     //   sharedPreferences.setString("token", jsonResponse['token']);
       // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyApp()), (Route<dynamic> route) => false);
    ///  GetPage(
         //  name: "/",
          // page: () => HomePage();
           // Navigator.push(context,MaterialPageRoute(builder: (context) =>LoginPage()),
           // );
            // page: () => LoginPage(),
          //);
     // }
    }
    else {
       Get.snackbar(
              "Sucessful Login",
               "plz cheack"+"password${response.body}",
               icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.red,
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
            //   dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
     // setState(() {
     //   _isLoading = false;
     // });
      errorMsg = response.body;
      print("The error message is: ${response.body}");
      print("nooo");
    }
  }
  Register(oldpasswordcontroller.text,newpasswordcontroller.text,conformpasswordcontroller.text,);
 }

//  const Changepassword({Key? key}) : super(key: key);
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Change Password",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 16.sp, letterSpacing: 1.2),
        ),
        actions: [
          IconButton(
            onPressed: () { post();
            //   Register(current_passwordController.text,new_passwordController.text, password_conformationController.text);
            },
            icon: Icon(Icons.check),
          )
        ],
      ),
      body:  SafeArea(
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
                       // alignment: Alignment.center,
                     //   child: ClipOval(
                       //   child: Image.asset("assets/images/person.jpg",
                           // "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Z2lybCUyMHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
                          //  width: 107.w,
                           // height: 107.w,
                           // fit: BoxFit.cover,
                        //  ),
                      //  ),
                   //   ),
                     // Align(
                      //  alignment: Alignment.bottomRight,
                     //   child: FloatingActionButton(
                      //    onPressed: () {},
                      //    mini: true,
                        //  child: Icon(Icons.camera_alt_rounded),
                       // ),
                      ),
                    ],
                  ),
                ),
              ),
              
              TextFormField(
                controller:oldpasswordcontroller,
                decoration: InputDecoration(
    hintText: "Enter old password",),
  
                //initialValue: "oldpassword",
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 28.h),
              
              TextFormField(
                 decoration: InputDecoration(
    hintText: "Enter new password",),
                controller:newpasswordcontroller,
               // initialValue: "newpassword",
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 28.h),
               
              TextFormField(
                controller:conformpasswordcontroller,
                 decoration: InputDecoration(
    hintText: "Enter Re-enter password",),
               // initialValue: "conformpassword",
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
     // ),
    ));//);
  }
}
