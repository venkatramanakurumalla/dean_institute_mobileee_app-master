import 'dart:convert';
import 'package:dean_institute_mobile_app/pages/home_items/home_main_page.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/subone.dart';
import 'package:dean_institute_mobile_app/widgets/home_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:get/get.dart";
import 'package:dean_institute_mobile_app/pages/course_details_page.dart';
import 'package:dean_institute_mobile_app/controllers/course_selection_controller.dart';
import 'package:dean_institute_mobile_app/data/models/batch_model.dart';
import 'package:dean_institute_mobile_app/data/models/sample_course_model.dart';
import 'package:dean_institute_mobile_app/pages/home_items/sample_data.dart';
import 'package:dean_institute_mobile_app/utility/constants.dart';
import 'package:dean_institute_mobile_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_all.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/dp.dart';
//import 'package:dean_institute_mobile_app/pages/home_items/dpa.dart';


  
void main() => runApp(cl());
  
class cl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: BatchSelection(courseModel:true),
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
class BatchSelection extends StatefulWidget {
  final SampleCourseModel courseModel;
  const BatchSelection({Key? key, required this.courseModel}) : super(key: key);
  static final sampleData = SampleData();

  @override
  _BatchSelectionState createState() => _BatchSelectionState();
}

class _BatchSelectionState extends State<BatchSelection> {
  late final BatchSelectionController _controller;

  @override
  void initState() {
    _controller = BatchSelectionController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
    
  Future<List<batch>> getRequest() async {
    //replace your restFull API here.
   // String url = "https://www.deaninstitute.fastrider.co/api/category-to-subcategory/1";
   // String url ="https://deaninstitute.fastrider.co/api/all-sub-category";
    // String url="https://www.deaninstitute.fastrider.co/api/course-by-subcategory/1";
      String url= "https://deaninstitute.fastrider.co/api/course-by-category/3";

    //https://https://www.deaninstitute.fastrider.co/api/category-to-subcategory/1
    final response = await http.get(Uri.parse(url));
  
    var responseData = json.decode(response.body);
  
    //Creating a list to store input data;
    List<batch> users = [];
   for (var singleUser in responseData) {
      batch user = batch(
         id: singleUser["id"],
         startDate: singleUser['start_date'],
         timings: singleUser["timeings"],
         classDay: singleUser["class_date"]
        // description: singleUser['description'],
       // title:singleUser["title"], 
       // sellingPrice:singleUser["selling_price"],
        //image: singleUser["image"],
        //sellingPrice:singleUser["sellingPrice"],
         // subcategory_logo: singleUser["subcategory_logo"],
       // subcategory_name: singleUser["subcategory_name"],
         // slug: singleUser["slug"]);
         // title: singleUser["title"]
         );
  
      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              height: 1.5,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8.w,
            crossAxisSpacing: 8.w,
            childAspectRatio: 2,
            shrinkWrap: true,
            children: _getGridItems(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              "Have a coupon code?",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: textColor,
              ),
            ),
          ),
          DefaultNoLabelTextForm(),
        ],
      ),
    );
  }

  _getGridItems() {
    List<Widget> items = [];
    var firstItem = EnrollmentTimeCard(isFirstItem: true);
    items.add(firstItem);
    int index = 0;
    BatchSelection.sampleData.batches.forEach((element) {
      var item = new EnrollmentTimeCard(
        isFirstItem: false,
        batch: element,
        position: index++,
      );
      items.add(item);
    });
    return items;
  }
}

class EnrollmentTimeCard extends StatefulWidget {
  final Batch batch;
  final int position;
  final bool isFirstItem;
  const EnrollmentTimeCard(
      {Key? key,
      this.batch = const Batch.empty(),
      required this.isFirstItem,
      this.position = -1})
      : super(key: key);

  @override
  _EnrollmentTimeCardState createState() => _EnrollmentTimeCardState();
}

class _EnrollmentTimeCardState extends State<EnrollmentTimeCard> {
  bool isSelected = false;
  static const activeColor = Color(0xFF45445B);
  static const inactiveColor = Colors.transparent;
  static const activeTextColor = Colors.white;
  static const inactiveTextColor = activeColor;
  late final BatchSelectionController _controller;

  @override
  void initState() {
    this.isSelected = widget.isFirstItem;
    _controller = new BatchSelectionController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateSelection() {
    isSelected = _controller.selectedIndex == widget.position;
    print("${widget.position} is selected $isSelected");
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        updateSelection();
      });
    });

    //print(widget.isFirstItem);
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? activeColor : inactiveColor,
          border: Border.all(color: activeColor.withAlpha(100)),
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              _controller.selectedIndex = widget.position;
              /*setState(() {
                isSelected = !isSelected;

              });*/
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
              child: (widget.isFirstItem)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Skip Batch Selection",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: isSelected
                                ? activeTextColor
                                : inactiveTextColor,
                          ),
                        ),
                        Text(
                          "100% refund if preferred batch is not allotted.",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            fontSize: 8.sp,
                            color: isSelected
                                ? activeTextColor
                                : inactiveTextColor,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.batch.days,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                color: isSelected
                                    ? activeTextColor
                                    : inactiveTextColor,
                              ),
                            ),
                            Spacer(),
                            Text(
                              widget.batch.date,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: isSelected
                                    ? activeTextColor
                                    : inactiveTextColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.w,
                        ),
                        Text(
                          widget.batch.time,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            fontSize: 8.sp,
                            color: isSelected
                                ? activeTextColor
                                : inactiveTextColor,
                          ),
                        ),
                      ],
                    ),
            )),
      ),
    );
  }
}
/*

 */
