import 'dart:convert';
import 'package:dean_institute_mobile_app/pages/enrollment/payment_checkout.dart';
import 'package:dean_institute_mobile_app/pages/home_items/batch.dart';
import 'package:dean_institute_mobile_app/pages/home_items/coupon.dart';
import 'package:dean_institute_mobile_app/pages/home_items/home_main_page.dart';
import 'package:dean_institute_mobile_app/pages/payment.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/subone.dart';
import 'package:dean_institute_mobile_app/widgets/home_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import "package:get/get.dart";
import 'package:dean_institute_mobile_app/pages/course_details_page.dart';

import 'detail_all.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/dp.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/dpa.dart';


  
void main() => runApp(select_batch());
  
class select_batch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class batch {
  int? id;
  int? courseId;
  String? startDate;
  String? classDay;
  String? timings;
  String? createdAt;
  String? updatedAt;

  batch(
      {this.id,
      this.courseId,
      this.startDate,
      this.classDay,
      this.timings,
      this.createdAt,
      this.updatedAt});

  batch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    startDate = json['start_date'];
    classDay = json['class_day'];
    timings = json['timings'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_id'] = this.courseId;
    data['start_date'] = this.startDate;
    data['class_day'] = this.classDay;
    data['timings'] = this.timings;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {
//Applying get request.
 final emailController = TextEditingController();
  
  Future<List<batch>> getRequest() async {
    //replace your restFull API here.
   // String url = "https://www.deaninstitute.fastrider.co/api/category-to-subcategory/1";
   // String url ="https://deaninstitute.fastrider.co/api/all-sub-category";
    // String url="https://www.deaninstitute.fastrider.co/api/course-by-subcategory/1";
     // String url= "https://deaninstitute.fastrider.co/api/course-by-category/3";
   //  String url= "https://deaninstitute.fastrider.co/api/course-batch/"+g.toString();
    String url= "https://deaninstitute.fastrider.co/api/course-batch/"+g.toString();

    //https://https://www.deaninstitute.fastrider.co/api/category-to-subcategory/1
    final response = await http.get(Uri.parse(url));
  
    var responseData = json.decode(response.body);
  
    //Creating a list to store input data;
    List<batch> users = [];
   for (var singleUser in responseData) {
      batch user = batch(
         id: singleUser["id"],
         courseId:singleUser["course_id"] ,
         classDay:singleUser["class_day"] ,
         startDate:singleUser["start_date"],
         timings:singleUser["timings"] ,
        // description: singleUser['description'],
       // title:singleUser["title"], 
       // sellingPrice:singleUser["selling_price"],
        //image: singleUser["image"],
        //sellingPrice:singleUser["sellingPrice"],
         // subcategory_logo: singleUser["subcategory_logo"],
       // subcategory_name: singleUser["subcategory_name"],
        //  slug: singleUser["slug"]);
         // title: singleUser["title"]
         );
  
      //Adding user to the list.
      users.add(user);
    }
    return users;
  }
  
  @override
var k=Get.arguments[0];
var g=Get.arguments[1];
  Widget build(BuildContext context) {
   // return SafeArea(
     // child: Scaffold(
     //   backgroundColor: Color(0xFFE9E9E9),
     //   appBar: AppBar(backgroundColor:Colors.red,
       //   title: Text("IT courses"),
          //leading: Icon(
           // Icons.get_app,
         // ),
      //  ),

 return Scaffold(
     // backgroundColor: Color(0xFF932020);
      appBar: AppBar(
 backgroundColor: Color(0xFF932020),
       // backgroundColor:Colors.red,
       // leading: Contain
       // er(),
       title:Text("Select Batch",textAlign: TextAlign.center),
      //  toolbarHeight: 163.h,
       // shape: RoundedRectangleBorder(
         //   borderRadius: BorderRadius.only(
         // bottomLeft: Radius.circular(30.r),
         // bottomRight: Radius.circular(30.r),
       // )),
        //flexibleSpace: HomePageAppBar(),),

      ),
        body: // Flexible(uy
    
        





                        

        Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return  ListView.builder(
                  // GridView.builder(
          //  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
             //   maxCrossAxisExtent: 300,
             //   childAspectRatio: 3 / 2,
              //  crossAxisSpacing:5,
              //  mainAxisSpacing: 5),
                  itemCount: snapshot.data.length,
                 itemBuilder: (ctx, index){return Container(
            child:      SizedBox(
 // height: double.infinity, 
// height: 1000,

    
              child:     Card(
        elevation: 1.0,
        child: Column(
          children: [
            ListTile(
             title: Text(snapshot.data[index].startDate,textAlign: TextAlign.center,),
              subtitle: Text(snapshot.data[index].timings),
          
           //  trailing: Image.network('https://deaninstitute.fastrider.co//'+snapshot.data[index].image),
            // trailing: Icon(Icons.book_online),
              onTap: () {
               // Get.to(PaymentCheckout(),arguments:[k]);
               Get.to(coupon(),arguments:[k,g]);
               // Get.to(RegistePage(),arguments:[k]);
                   //  var p=snapshot.data[index].sellingPrice.toString();
                    //  Get.to(CourseDetailsAll(),arguments:[snapshot.data[index].image,snapshot.data[index].description,snapshot.data[index].slug,p]);
                 // ),
                       }  ),

           // ),
               // shape: RoundedRectangleBorder(
     // borderRadius: BorderRadius.circular(10.0),
    //),
    //elevation: 5,
   // margin: EdgeInsets.all(10),
          ]),
),   
                 // child:
              // child:   buildCard(),
              //  alignment: Alignment.center,
                 // child:   Text(snapshot.data[index].slug),
               // child: Text(myProducts[index]["name"]),
               // decoration: BoxDecoration(
                  ////  color: Colors.green,
                  //  borderRadius: BorderRadius.circular(20)),
           //   );
                  
                   
                   
                    
                    
                   
                  // } 
            // ]  
             ));//);
              //}
            },
         // ),
        //),
     );
  }})
  ));}}