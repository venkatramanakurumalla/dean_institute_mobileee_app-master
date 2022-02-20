import 'dart:convert';
import 'package:dean_institute_mobile_app/pages/home_items/High_school.dart';
import 'package:dean_institute_mobile_app/pages/home_items/It.dart';
import 'package:dean_institute_mobile_app/pages/home_items/cloud.dart';
import 'package:dean_institute_mobile_app/pages/home_items/data.dart';
import 'package:dean_institute_mobile_app/pages/home_items/home_main_page.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/subone.dart';
import 'package:dean_institute_mobile_app/widgets/home_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:get/get.dart";
import 'package:dean_institute_mobile_app/pages/course_details_page.dart';

import 'home_items/detail_all.dart';

//import 'detail_all.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/dp.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/dpa.dart';


  
void main() => runApp(cate());
  
class cate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class user {
  int? id;
  String? categoryName;
  String? categoryLogo;
  String? slug;
  int? order;
  String? createdAt;
  String? updatedAt;

  user(
      {this.id,
      this.categoryName,
      this.categoryLogo,
      this.slug,
      this.order,
      this.createdAt,
      this.updatedAt});

  user.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    categoryLogo = json['category_logo'];
    slug = json['slug'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['category_logo'] = this.categoryLogo;
    data['slug'] = this.slug;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
 
//Creating a class user to store the data;
class User1 {
   var id;
  var category_id;
 // var subcategory_name;
  // final String subcategory_logo ;
  var slug;
  var order;
  var created_at;
  var updated_at;
  //final int id;
  
  
  User1({
    required this.id,
    //required this.subcategory_name,
    required this.slug,
   // requiredrequired this.subcategory_logo,
  });
}
  
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {
//Applying get request.
  
  Future<List<user>> getRequest() async {
    //replace your restFull API here.
   // String url = "https://www.deaninstitute.fastrider.co/api/category-to-subcategory/1";
   // String url ="https://deaninstitute.fastrider.co/api/all-sub-category";
    // String url="https://www.deaninstitute.fastrider.co/api/course-by-subcategory/1";
     // String url= "https://deaninstitute.fastrider.co/api/course-by-category/1";
     String url="https://deaninstitute.fastrider.co/api/all-category";

    //https://https://www.deaninstitute.fastrider.co/api/category-to-subcategory/1
    final response = await http.get(Uri.parse(url));
  
    var responseData = json.decode(response.body);
  
    //Creating a list to store input data;
   List<user> users = [];
   for (var singleUser in responseData) {
      user User = user(
         id: singleUser["id"],
         categoryLogo:singleUser["category_logo"],
         categoryName:singleUser["category_name"],
         
        // description: singleUser['description'],
       // title:singleUser["title"], 
        //sellingPrice:singleUser["selling_price"],
      //  image: singleUser["image"],
        //sellingPrice:singleUser["sellingPrice"],
         // subcategory_logo: singleUser["subcategory_logo"],
       // subcategory_name: singleUser["subcategory_name"],
          slug: singleUser["slug"]);
         // title: singleUser["title"]);
  
      //Adding user to the list.
      users.add(User);
    }
    return users;
  }
  
  
  @override

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
       title:Text(" Courses",textAlign: TextAlign.center),
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
                return ListView.builder(
                  // GridView.builder(
          //  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //  maxCrossAxisExtent: 300,
               // childAspectRatio: 3 / 2,
               // crossAxisSpacing:5,
               // mainAxisSpacing: 5),
                  itemCount: snapshot.data.length,
                 itemBuilder: (ctx, index){return Container(
            child:      SizedBox(
 // height: double.infinity, 
 height: 100,
    
              child:     Card(
        elevation: 1.0,
        child: Column(
          children: [
             
               ListTile(
                 // title: Text(snapshot.data[index].categoryName),
                subtitle: Text(snapshot.data[index].categoryName),
                 // leading: CircleAvatar(
                  //  background 
                   leading: Image.network("https://deaninstitute.fastrider.co//"+snapshot.data[index].categoryLogo),
          //  ListTile(
           //  title: Text(snapshot.data[index].categoryName,textAlign: TextAlign.center,),
              //subtitle: Text("Enroll now"),
          
           //  trailing: Image.network('https://deaninstitute.fastrider.co//'+snapshot.data[index].image),
            // trailing: Icon(Icons.book_online),
              onTap: () {
                if(index==0){
                  Get.to(It());
                }
                else if(index==1){
                  Get.to((hi()));
                  
                }
                 else if(index==2){
                  Get.to((cl()));
                  
                }
                 else if(index==3){
                 // Get.to((cl()));
                  
                }
                 else if(index==4){
                 // Get.to((data()));
                  
                }
                 else if(index==5){
                    Get.to((data()));
                 // Get.to((cl()));
                  
                }
                 else if(index==6){
                 // Get.to((cl()));
                  
                }

                    // var p=snapshot.data[index].sellingPrice.toString();
                     // Get.to(CourseDetailsAll(),arguments:[snapshot.data[index].image,snapshot.data[index].description,snapshot.data[index].slug,p]);
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
  }})));}}