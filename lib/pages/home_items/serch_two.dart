

import 'dart:async';
import 'dart:convert';
import 'package:dean_institute_mobile_app/pages/home_items/detail_all.dart';
import 'package:dean_institute_mobile_app/pages/home_items/home_main.dart';
import 'package:dean_institute_mobile_app/pages/home_items/serchall.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:get/get.dart";

class Jobs extends StatefulWidget {
  Jobs() : super();

  @override
  JobsState createState() => JobsState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class JobsState extends State<Jobs> {
  final _debouncer = Debouncer();

  List<Subject> ulist = [];
  List<Subject> userLists = [];
  //API call for All Subject List

 // String url ='https://www.deaninstitute.fastrider.co/api/search-course?Qa';

   String url = "https://www.deaninstitute.fastrider.co/api/course";

  Future<List<Subject>> getAllulistList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        List<Subject> list = parseAgents(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Subject> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Subject>((json) => Subject.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    getAllulistList().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
      });
    });
  }

  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(
      //  title: Text(
         // ' Couses',
        //  style: TextStyle(fontSize: 25),
      //  ),
     // ),
      body: Column(
        children: <Widget>[
          //Search Bar to List of typed Subject
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                suffixIcon: InkWell(
                  child: Icon(Icons.search),
                ),
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search ',
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    userLists = ulist
                        .where(
                          (u) => (u.slug.toString().contains(
                                string.toLowerCase(),
                              )),
                        )
                        .toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(5),
              itemCount: userLists.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            userLists[index].title.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            userLists[index].slug.toString(),
                            style: TextStyle(fontSize: 16),),

onTap: () { Get.to(serchall());
                   // var p=userLists[index].sellingPrice.toString();
                      //Get.to(CourseDetailsAll(),arguments:[userLists[index].image,userLists[index].description,userLists[index].slug,p]);
                 // ),
                       }




                          //   onTap: () {
                             //  Get.to(al);
                 //    var p=snapshot.data[index].sellingPrice.toString();
                    //  var snapshot;
                     // Get.to(CourseDetailsAll(),arguments:[userLists[index].image,userLists[index].description.toString(),userLists[index].slug.toString(),userLists[index].sellingPrice.toString()]);
                 // ),
                      // }
                         // ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class Subject {
 // var text;
 // var author;
  var title;
  var slug;
   var id;
  var  categoryId;
  var subcategoryId;
  var childcategoryId;
// late String title;
//  late String slug;
  var description;
  var image;
  var classType;
  var video;
 var enroll;
  var hours;
  var meetingLink;
  var classStartTime;
  var referenceLink;
  var materialLink;
  var reviewClass;
  var sellingPrice;
  var discountType;
  var discount;
 var discountPrice;
 var priceActive;
  var seoKeyword;
 var seoDescription;
  var order;
  var status;
 var createdBy;
  var updatedBy;
  var deletedBy;
   var  createdAt;
  var  updatedAt;
  Subject({
   // required this.text,
   // required this.author,
    required this.title,
    required this.slug,
    required this.image,
    required this.sellingPrice,
    required this.description,
  //  required this.discount
    


  });

  factory Subject.fromJson(Map<dynamic, dynamic> json) {
    return Subject(
      title: json['title'],
      slug: json['slug'],
       image: json['image'],
       //sellingPrice:json['selling_Price'],
       sellingPrice:json['selling_Price'],
       description: json["description"]
    );
  }
}
//Declare Subject class for json data or parameters of json string/data
//Class For Subject




  
 // }
//}