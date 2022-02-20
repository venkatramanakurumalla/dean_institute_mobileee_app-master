import 'package:dean_institute_mobile_app/ui/auth/login/login_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dean_institute_mobile_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:get_storage/get_storage.dart';


class LoginPage extends StatelessWidget {
  // var box = GetStorage();
   final userdata = GetStorage();
 // class LoginPage extends GetxController {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FlutterSecureStorage localStorage = new FlutterSecureStorage();
 // Controller controller = Get.put(Controller()); 
  // Controller controller1 = Get.put(Controller(), tag: 'aUniqueTag');

 /// _login() {
    //controller.loginUser(, password);
  //}
  //Map data = {
      
    //  'email': email,
   //  'password': pass
   // };
  
 static r(){
 FlutterSecureStorage localStorage = new FlutterSecureStorage();
     localStorage.write(key: "email", value: "email").obs;
      var k=localStorage.read(key: "email").obs;

    }
     
 // @override
 void post(){
  // r();userdata.write('isLogged', true);
                
    bool _isLoading = false;
  var errorMsg;
  Register(String  email,  pass,) async {
    
    FlutterSecureStorage _localStorage = new FlutterSecureStorage();
     await _localStorage.write(key: "email", value: "email").obs;
    localStorage.read(key: "email").obs;
    GetStorage box = GetStorage();
    box.write('email',val(email));
    userdata.write('isLogged', true);
                  userdata.write('email',email );
// SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Map data = {
      
      'email': email,
     'password': pass
    };
    
     GetStorage box1 = GetStorage();
    box1.write('email',email);
    var jsonResponse = null;
    // Controller c = Get.put(Controller());
   var r=email.obs;
   Obx(() => Text("${email}"));
  //Uri('https://reqres.in/api/register');
    var response = await http.post(Uri.parse('https://deaninstitute.fastrider.co/api/login'), body: data);
    if(response.statusCode == 200) {
      
// var status =prefs.setBool("isLoggedIn", true);
      // print(status);
   //  Get.to(HomePage(),arguments:email);
     
      jsonResponse = json.decode(response.body);
      print(jsonResponse); 
      userdata.write("name",jsonResponse["name"]);
     userdata.write("body",response.body);
      Get.to(HomePage(),arguments:email);
     
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString("token",response['token']);
     //// asyncFunc() async { // Async func to handle Futures easier; or use Future.then
 // SharedPreferences prefs = await SharedPreferences.getInstance();
//}

// Set
//prefs.setString('token',jsonResponse);
// Get
//String token = prefs.getString('apiToken');
// Remove
//prefs.remove('apiToken');
         print(jsonResponse); 
      // var  v=jsonResponse.obs;
       
     // https://www.deaninstitute.fastrider.co/api/user?access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZjk3OTQ3Y2IwODZhMTU4MWJlNzYxYzY2MTM4YzVjNGFiNGNhNWRmOGRiYjIyOTU5NDcyZTlhOWI5N2Q3ZmI2ZTQwMmM4NDhiZDkyOTAzODgiLCJpYXQiOjE2MzkyMTA5OTcuNDYyNDg4ODg5Njk0MjEzODY3MTg3NSwibmJmIjoxNjM5MjEwOTk3LjQ2MjQ5Mjk0MjgxMDA1ODU5Mzc1LCJleHAiOjE2NzA3NDY5OTcuMjEyODYyOTY4NDQ0ODI0MjE4NzUsInN1YiI6IjE3Iiwic2NvcGVzIjpbXX0.qT9smrC_BxmKKuGTBj8SUI3RDgiR2JcoCP8Yakp-kEk2OzG43E8gNGweusZE4M3u46K43Gn9YORri_GcTmSzGy1-C_LTVAVTte1FHLiZQgzkTVworijHRnBvhnOk4WL-378Qrnd55_r8dzrPbvi-7c8WG2qfHQ-Fu0u2GH3Ji7GCt9wMkRucyjQZd6QNYq_JQFZg4MKoUYuQvBsufrilqW8r8QVDKKaNWDaIG-lFANsKiah8Zdq0eFmkDbaSaFXrIueA6RiC0nCJge5UdePQQnZYorz2tfK0gUE4SeOjn8BNt-4mY4Brd-p5rpKsZDut9SiNoQpKjzI3JHiEeGQydGgnT6sily1djvy_TK-irB6LN6MREvC7zr8aqnJ6SpgDUIvdtSezCxeCfLK_WhFzDkI35_TOXveh_uhYXxJOrcThln4Wj0JKC5-th_2KIcmszQ23gBOAPlEju_HMt9llA7euow186SsvHnzLG-sK3V6UTAYJzUqkb7-MB7JXvymTCqyH0l0BNhs3ry8RFXtUe5TpBEl4UTMNzR8-A9IJUAbCqUSfd2XMcWrL9m-p-7ZgwQk6mAEl1mJKZSICPjL60TZlUbcpCPkELQdJLjYe9CVqDU303AF79HH0cYIVT10TqM_E4Tjd741-LHPN6CpYlEiP_GMbeEuribKsVUjMdRY
       // Get.snackbar("Sucess", "Login Sucess");
       Get.snackbar(
              "Sucessful Login",
               "Hello everyone"+""+email,
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
      print(r);
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
              "Un.Sucessful Login",
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
  Register(emailController.text, passwordController.text);
 }

  void postt(){Register(String email, pass) async {
    r();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FlutterSecureStorage _localStorage = new FlutterSecureStorage();
    Map data = {
      'email': email,
      'password': pass
    }; 
    
    await _localStorage.write(key: "email", value: "email");
   var k= await _localStorage.read(key:  email).obs;

    var jsonResponse = null;
    var response = await http.post(Uri.parse('https://deaninstitute.fastrider.co/api/login'), body: data);
    if(response.statusCode == 200) {
       SharedPreferences prefs = await SharedPreferences.getInstance();
 prefs.setBool("isLoggedIn", true);
 
      Get.to(HomePage());
      jsonResponse = json.decode(response.body);
      
      print(jsonResponse);
       print(jsonResponse);  
      print("sucess");
      
      if(jsonResponse != null) {
      //  setState(() {
        // _isLoading = false;
       // });
        sharedPreferences.setString("token", jsonResponse['token']);
      //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainPage()), (Route<dynamic> route) => false);
      }
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
             //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
     // setState(() {
        //_isLoading = false;
     // });
     // errorMsg = response.body;
      print("The error message is: ${response.body}");
    }
  }
  
  }
  
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
                   
                        // controller: emailController,
                        
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
                     //   CheckBoxWithTitle(),
                        ElevatedButton(
                          onPressed: () { 
     
                          
          
                            post();
                          //  Register(nameController.text,emailController.text, passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  left: 30.w,
                                  right: 30.w,
                                  top: 16.w,
                                  bottom: 16.w)),
                          child: Text(
                            "logn in",
                            style: GoogleFonts.lato(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                           
                            ),


                            
                          
                         ),
                        ),

                         TextButton(
                            onPressed: () {
                              Get.toNamed("/signUp");
                            },
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.lato(fontSize: 12.sp),
                            ))
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
  }}