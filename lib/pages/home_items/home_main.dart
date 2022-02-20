import 'dart:convert';

import 'package:dean_institute_mobile_app/pages/home_items/sample_data.dart';
import 'package:dean_institute_mobile_app/widgets/course_list_item.dart';
import 'package:dean_institute_mobile_app/widgets/dynamic_tabs.dart';
import 'package:dean_institute_mobile_app/widgets/home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'detail_all.dart';


class User {
  late int id;
  late int categoryId;
  late int subcategoryId;
  late int childcategoryId;
 late String title;
  late String slug;
  late String description;
  late String image;
  late String classType;
  late Null video;
 late String enroll;
  late String hours;
  late Null meetingLink;
  late Null classStartTime;
  late Null referenceLink;
  late Null materialLink;
  late String regularClass;
  late String reviewClass;
  late String sellingPrice;
  late String discountType;
  late String discount;
 late String discountPrice;
 late String priceActive;
  late Null seoKeyword;
 late  Null seoDescription;
  late Null order;
  late String status;
 late  String createdBy;
  late String updatedBy;
   late Null deletedBy;
   late String createdAt;
  late String updatedAt;

  User(
      { required this.image,
         required this.id,
          required this.slug,
           required this.title,
             required this.description, 
             required this.sellingPrice,
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    childcategoryId = json['childcategory_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    classType = json['class_type'];
    video = json['video'];
    enroll = json['enroll'];
    hours = json['hours'];
    meetingLink = json['meeting_link'];
    classStartTime = json['class_start_time'];
    referenceLink = json['reference_link'];
    materialLink = json['material_link'];
    regularClass = json['regular_class'];
    reviewClass = json['review_class'];
    sellingPrice = json['selling_price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    priceActive = json['price_active'];
    seoKeyword = json['seo_keyword'];
    seoDescription = json['seo_description'];
    order = json['order'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] =this.categoryId;
    data['subcategory_id'] =this.subcategoryId;
    data['childcategory_id'] = this.childcategoryId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image'] = this.image;
    data['class_type'] = this.classType;
    data['video'] = this.video;
    data['enroll'] = this.enroll;
    data['hours'] = this.hours;
    data['meeting_link'] = this.meetingLink;
    data['class_start_time'] =this.classStartTime;
    data['reference_link'] =this.referenceLink;
    data['material_link'] = this.materialLink;
    data['regular_class'] = this.regularClass;
    data['review_class'] = this.reviewClass;
    data['selling_price'] =this.sellingPrice;
    data['discount_type'] = this.discountType;
    data['discount'] = this.discount;
    data['discount_price'] =this.discountPrice;
    data['price_active'] = this.priceActive;
    data['seo_keyword'] =this.seoKeyword;
    data['seo_description'] = this.seoDescription;
    data['order'] =this.order;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] =this.updatedBy;
    data['deleted_by'] = this.deletedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
  
Future<List<User>> getRequest() async {
    //replace your restFull API here.
     String url = "https://www.deaninstitute.fastrider.co/api/course";
  //  String url = "https://www.deaninstitute.fastrider.co/api/course";
    //https://www.deaninstitute.fastrider.co/api/course-by-subcategory/1
    final response = await http.get(Uri.parse(url));
  
    var responseData = json.decode(response.body);
  
    //Creating a list to store input data;
    List<User> users = [];
   for (var singleUser in responseData) {
      User user = User(
         id: singleUser["id"],
         title:singleUser["title"], 
         image: singleUser["image"],
          slug: singleUser["slug"],
          sellingPrice:singleUser["selling_price"],
        // sellingPrice:["sellingprice"],
         description: singleUser["description"]);
       //  sellingPrice: singleUser["sellingPrice"],
         // subcategory_logo: singleUser["subcategory_logo"],
       // subcategory_name: singleUser["subcategory_name"],
        //  slug: singleUser["slug"]);
  
      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

class Home1 extends StatelessWidget {
  var p;

//  const Home1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      appBar: AppBar(
        leading: Container(),
        toolbarHeight: 163.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        )),
        flexibleSpace: HomePageAppBar(),
      ),
      body: 
        // Flexible(
        
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
                return //ListView.builder(
                   GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 2,
                crossAxisSpacing:5,
                mainAxisSpacing: 5),
                  itemCount: snapshot.data.length,
                 itemBuilder: (ctx, index){return Container(
            child:      SizedBox(
 // height: double.infinity, 
// height: 10,
    
              //child:     Card(clipBehavior: Clip.antiAlias,
       // shape: RoundedRectangleBorder(
          //borderRadius: BorderRadius.circular(10.0),
                //color:Colors.blueAccent,
      ///elevation: 1.0,
        child:  Column(
          children: [
            ListTile(
             // title: Text(snapshot.data[index].slug,textAlign: TextAlign.center,),
              //subtitle: Text("Enroll now"),
              
        //  trailing:
          
    title:
         Container(
           
          // width:10,
                // height: 10.h,
          child:
         Image.network('https://deaninstitute.fastrider.co//'+snapshot.data[index].image,fit: BoxFit.cover,),),
          
                
                
         // Image.network('https://deaninstitute.fastrider.co//'+snapshot.data[index].image,fit: BoxFit.cover,),
            // subtitle: Icon(Icons.book_online),
             onTap: () {
                     // if(index==0){
                        var p=snapshot.data[index].sellingPrice.toString();
                      Get.to(CourseDetailsAll(),arguments:[snapshot.data[index].image,snapshot.data[index].description,snapshot.data[index].slug,p]);
                        // Get.to(CourseDetails(  courseModel: s, ));
                     // }
                      
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
            // ));//);
              //}
                 );},
         // ),
        //),
     );
  }})));}}



