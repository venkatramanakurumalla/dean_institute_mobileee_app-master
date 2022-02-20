import 'dart:math';

import 'package:dean_institute_mobile_app/data/models/batch_model.dart';
import 'package:dean_institute_mobile_app/data/models/payment_history_model.dart';
import 'package:dean_institute_mobile_app/data/models/sample_course_model.dart';

class SampleData {
  static const List<String> _sampleCourseTitles = [
    "Software Testing Fundamentals Course",
    "Learn Advance Software Developing",
    "Learn Python Programming",
    "Complete Kotlin Developer Tutorial",
    "Flutter Zero to Professional",
    "Express & Node - Complete Package"
  ];
  static const List<String> _sampleAuthors = [
    "Jennifer	Hamilton",
    "Caroline	Hunter",
    "Karen	Lee",
    "Michael	Terry",
    "Tracey	King",
    "Nicola	Graham",
    "Stewart	Walker",
    "Eric	Lyman",
    "Carl	Paterson",
    "Rachel	Lyman",
  ];
  static const List<String> _courseImages = [
    "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
    "https://img.freepik.com/free-photo/businessman-using-tech-devices-icons-thin-line-interface_117023-904.jpg?size=626&ext=jpg",
    "https://img.freepik.com/free-photo/tech-devices-icons-connected-digital-planet-earth_117023-449.jpg?size=626&ext=jpg",
    "https://bsmedia.business-standard.com/_media/bs/img/article/2021-01/14/full/1610640588-3918.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpdol9u6J-JU_6loczZYNxvmqN6GONLZ68IXTwwr791sRZ5Ws1Vvz3gGwxfwpFONJBrdI&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLvS6T8vdrVz1MUppDrL_d8ygP3ZdoZusRcw&usqp=CAU",
    "https://media.gettyimages.com/vectors/math-equations-written-on-a-blackboard-vector-id1219382595?s=612x612",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSGc0yxGztMFJk9uO3hi68_T0k1nRUt6CnWg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT53pk7BOaiah2xCqcqllc19Yg5GZ23GOWd6Q&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL01wJ8Mv4Pf8-QlI2t5kTzcpbExMRjpgCjQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0UHEcMdadYomW0HMYkghfdu4xspMdh7AdKQ&usqp=CAU",
  ];

  List<SampleCourseModel> sampleCourses = List.generate(10, (index) {
    double rating = ((Random().nextDouble() * 10) % 5);
    return new SampleCourseModel(
        courseTitle:
            _sampleCourseTitles[Random().nextInt(_sampleCourseTitles.length)],
        courseAuthor: _sampleAuthors[Random().nextInt(_sampleAuthors.length)],
        length: Random().nextDouble() * 100 / 2,
        price: Random().nextDouble() * 1000,
        rating: rating < 2 ? rating + 2 : rating,
        courseImage: _courseImages[Random().nextInt(_courseImages.length)],
        isBestSeller: Random().nextBool());
  });

  List<PaymentHistoryModel> paymentHistory = List.generate(10, (index) {
    return new PaymentHistoryModel(
        _sampleCourseTitles[Random().nextInt(_sampleCourseTitles.length)],
        "${Random().nextInt(31)} Aug",
        "12:24 pm",
        Random().nextDouble() * 1000,
        _courseImages[Random().nextInt(_courseImages.length)]);
  });

  final List<Batch> batches = [
    Batch("12 Aug", "9 am - 5 pm", "Sat - Sun"),
    Batch("12 Aug", "9 am - 5 pm", "Sat - Sun"),
    Batch("12 Aug", "9 am - 5 pm", "Sat - Sun"),
    Batch("12 Aug", "9 am - 5 pm", "Sat - Sun"),
    Batch("12 Aug", "9 am - 5 pm", "Sat - Sun"),
  ];
}
