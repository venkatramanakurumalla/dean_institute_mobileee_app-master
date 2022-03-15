import 'dart:convert';
import 'package:dean_institute_mobile_app/pages/home_items/detail_all.dart';
import 'package:dean_institute_mobile_app/pages/home_items/home_main_page.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/subone.dart';
import 'package:dean_institute_mobile_app/widgets/home_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:get/get.dart";
import 'package:dean_institute_mobile_app/pages/course_details_page.dart';
import 'package:dean_institute_mobile_app/widgets/SearchWidget.dart';

//import 'detail_all.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/dp.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/dpa.dart';


  
void main() => runApp(sear());
  
class sear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class search {
  int? id;
  int? categoryId;
  int? subcategoryId;
  int? childcategoryId;
  String? title;
  String? slug;
  String? description;
  String? image;
  String? classType;
  Null? video;
  String? enroll;
  String? hours;
  Null? meetingLink;
  Null? classStartTime;
  Null? referenceLink;
  Null? materialLink;
  String? regularClass;
  String? reviewClass;
  String? sellingPrice;
  String? discountType;
  String? discount;
  String? discountPrice;
  String? priceActive;
  Null? seoKeyword;
  Null? seoDescription;
  Null? order;
  String? status;
  String? createdBy;
  String? updatedBy;
  Null? deletedBy;
  String? createdAt;
  String? updatedAt;

  search(
      {this.id,
      this.categoryId,
      this.subcategoryId,
      this.childcategoryId,
      this.title,
      this.slug,
      this.description,
      this.image,
      this.classType,
      this.video,
      this.enroll,
      this.hours,
      this.meetingLink,
      this.classStartTime,
      this.referenceLink,
      this.materialLink,
      this.regularClass,
      this.reviewClass,
      this.sellingPrice,
      this.discountType,
      this.discount,
      this.discountPrice,
      this.priceActive,
      this.seoKeyword,
      this.seoDescription,
      this.order,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.deletedBy,
      this.createdAt,
      this.updatedAt});

  search.fromJson(Map<String, dynamic> json) {
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
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
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
    data['class_start_time'] = this.classStartTime;
    data['reference_link'] = this.referenceLink;
    data['material_link'] = this.materialLink;
    data['regular_class'] = this.regularClass;
    data['review_class'] = this.reviewClass;
    data['selling_price'] = this.sellingPrice;
    data['discount_type'] = this.discountType;
    data['discount'] = this.discount;
    data['discount_price'] = this.discountPrice;
    data['price_active'] = this.priceActive;
    data['seo_keyword'] = this.seoKeyword;
    data['seo_description'] = this.seoDescription;
    data['order'] = this.order;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['deleted_by'] = this.deletedBy;
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
  
  Future<List<search>> getRequest() async {
    //replace your restFull API here.
   // String url = "https://www.deaninstitute.fastrider.co/api/category-to-subcategory/1";
   // String url ="https://deaninstitute.fastrider.co/api/all-sub-category";
    // String url="https://www.deaninstitute.fastrider.co/api/course-by-subcategory/1";
     // String url= "https://deaninstitute.fastrider.co/api/course-by-category/3";
 //String url="https://www.deaninstitute.fastrider.co/api/search-course?Qa";
String url="https://www.deaninstitute.fastrider.co/api/course";
    //https://https://www.deaninstitute.fastrider.co/api/category-to-subcategory/1
    final response = await http.get(Uri.parse(url));
  
    var responseData = json.decode(response.body);
  
    //Creating a list to store input data;
    List<search> users = [];
   for (var singleUser in responseData) {
      search user = search(
         id: singleUser["id"],
         description: singleUser['description'],
       // title:singleUser["title"], 
        sellingPrice:singleUser["selling_price"],
        image: singleUser["image"],
        //sellingPrice:singleUser["sellingPrice"],
         // subcategory_logo: singleUser["subcategory_logo"],
       // subcategory_name: singleUser["subcategory_name"],
          slug: singleUser["slug"]);
         // title: singleUser["title"]);
  
      //Adding user to the list.
      users.add(user);
    }
    return users;
  }
   final controller = TextEditingController();
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
   //    title:Text("search",textAlign: TextAlign.center),
      //  toolbarHeight: 163.h,
       // shape: RoundedRectangleBorder(
         //   borderRadius: BorderRadius.only(
         // bottomLeft: Radius.circular(30.r),
         // bottomRight: Radius.circular(30.r),
       // )),
        //flexibleSpace: HomePageAppBar(),),

      ),
      body: // Flexible(uy
      Column(
          children: <Widget>[
           Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child:TextField(
  controller: controller,
  decoration: InputDecoration(
    hintText: "Enter a message",
   suffixIcon: IconButton(
      onPressed: () => getRequest(),
  icon: Icon(Icons.search),
    ),
  ),
      ),
     // child: TextField(
       // controller: controller,
       // decoration: InputDecoration(
    // IconButton(
   // icon:  Icon(Icons.search,),
          
              ),
        
     // ) ),
         //
            //buildSearch(),
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
 height: 1000,
    
              child:     Card(
        elevation: 1.0,
        child: Column(
          children: [
            ListTile(
             title: Text(snapshot.data[index].slug,textAlign: TextAlign.center,),
              //subtitle: Text("Enroll now"),
          
           //  trailing: Image.network('https://deaninstitute.fastrider.co//'+snapshot.data[index].image),
            // trailing: Icon(Icons.book_online),
              onTap: () {
                     var p=snapshot.data[index].sellingPrice.toString();
                      Get.to(CourseDetailsAll(),arguments:[snapshot.data[index].image,snapshot.data[index].description,snapshot.data[index].slug,p,snapshot.data[index].id]);
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
    

  }}))]));}
   
}