import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

//import 'package:dean_institute_mobile_app/pages/home_items/subone.dart';
//import 'package:dean_institute_mobile_app/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(hist());

class hist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class User {
  late int id;
  late String invoiceNo;
  late int userId;
  late int courseId;
  late int batchId;
  late String paymentType;
  late String paymentMethod;
  late String balanceTransaction;
  late String currency;
  late String amount;
  late Null cardNumber;
  late Null cardexpMonth;
  late Null cardexpYear;
  late Null cardCvv;
  late String countryCode;
  late String countryName;
  late String city;
  late String postal;
  late String latitude;
  late String longitude;
  late String ipv4;
  late String state;
  late String status;
  late String createdAt;
  late String updatedAt;

  User(
      {required this.id,
      required this.invoiceNo,
      required this.userId,
     // required this.courseId,
    //  required this.batchId,
     // required this.paymentType,
      //required this.paymentMethod,
      //required this.balanceTransaction,
     // required this.currency,
      required this.amount,
     // required this.cardNumber,
     // required this.cardexpMonth,
    //  required this.cardexpYear,
    //  required this.cardCvv,
    //  required this.countryCode,
     // required this.countryName,
     // required this.city,
     // required this.postal,
     // required this.latitude,
     // required this.longitude,
    //  required this.ipv4,
     // required this.state,
    //  required this.status,
     // required this.createdAt,
      //required this.updatedAt
      }
      );

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceNo = json['invoice_no'];
    userId = json['user_id'];
    courseId = json['course_id'];
    batchId = json['batch_id'];
    paymentType = json['payment_type'];
    paymentMethod = json['payment_method'];
    balanceTransaction = json['balance_transaction'];
    currency = json['currency'];
    amount = json['amount'];
    cardNumber = json['card_number'];
    cardexpMonth = json['cardexp_month'];
    cardexpYear = json['cardexp_year'];
    cardCvv = json['card_cvv'];
    countryCode = json['country_code'];
    countryName = json['country_name'];
    city = json['city'];
    postal = json['postal'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    ipv4 = json['ipv4'];
    state = json['state'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invoice_no'] = this.invoiceNo;
    data['user_id'] = this.userId;
    data['course_id'] = this.courseId;
    data['batch_id'] = this.batchId;
    data['payment_type'] = this.paymentType;
    data['payment_method'] = this.paymentMethod;
    data['balance_transaction'] = this.balanceTransaction;
    data['currency'] = this.currency;
    data['amount'] = this.amount;
    data['card_number'] = this.cardNumber;
    data['cardexp_month'] = this.cardexpMonth;
    data['cardexp_year'] = this.cardexpYear;
    data['card_cvv'] = this.cardCvv;
    data['country_code'] = this.countryCode;
    data['country_name'] = this.countryName;
    data['city'] = this.city;
    data['postal'] = this.postal;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['ipv4'] = this.ipv4;
    data['state'] = this.state;
    data['status'] = this.status;
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
//SharedPreferences prefs = await SharedPreferences.getInstance();
  
  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    SharedPreferences prefs = await SharedPreferences.getInstance();
     String? access_token = prefs.getString('access_token');
     //String? user_id = prefs.getString('user_id');
      var user_id = prefs.getInt('id');

     String url = 'https://deaninstitute.fastrider.co/api/payment-history/'+user_id.toString();
    //String url = 'https://deaninstitute.fastrider.co/api/payment-history/18';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ' + access_token.toString(),
        },
      );
  
    var responseData = json.decode(response.body);
  
    //Creating a list to store input data;
    List<User> users = [];
   for (var singleUser in responseData) {
      User user = User(
         id: singleUser["id"],
         invoiceNo:singleUser["invoice_no"], 
         userId: singleUser["user_id"],
        amount: singleUser["amount"], 
         
       //  sellingPrice: singleUser["sellingPrice"],
         // subcategory_logo: singleUser["subcategory_logo"],
       // subcategory_name: singleUser["subcategory_name"],
         );
  
      //Adding user to the list.
      users.add(user);
    }
    return users;
  }
  
  @override
   Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xFF932020);
        appBar: AppBar(
          backgroundColor: Color(0xFF932020),
          // backgroundColor:Colors.red,
          // leading: Contain
          // er(),
          title: Text("History", textAlign: TextAlign.center),
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
                        return 
                        Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return ListView.builder(
                           // GridView.builder(
                         // gridDelegate:
                             // const SliverGridDelegateWithMaxCrossAxisExtent(
                                //  maxCrossAxisExtent: 300,
                                 // childAspectRatio: 3 / 2,
                                 // crossAxisSpacing: 5,
                                 // mainAxisSpacing: 5),
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, index) {
                            return
                            Card(
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
                           "amount:" +snapshot.data[index].amount.toString(),
                           // userLists[index].title.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            "invoice number:"+snapshot.data[index].invoiceNo,
                           // userLists[index].slug.toString(),
                            style: TextStyle(fontSize: 16),)
                            
                            
                         ) ],     
                        ),
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                         //    Container(
                           //   child: SizedBox(
                                // height: double.infinity,
                               // height: 1000,

                                //child:     Card(
                                // elevation: 1.0,
                             //   child: Column(children: [
                               //   ListTile(
                                     //  title: Text(snapshot.data[index].userId,textAlign: TextAlign.center,),
                                  //  subtitle: Text("invoice number"+snapshot.data[index].invoiceNo),

                                    //    trailing:Text(snapshot.data[index].amount),
                                    // trailing: Icon(Icons.book_online),
                                  ),

                                  // ),
                                  // shape: RoundedRectangleBorder(
                                  // borderRadius: BorderRadius.circular(10.0),
                                  //),
                                  //elevation: 5,
                                  // margin: EdgeInsets.all(10),
                            //    ]),
                            //  ),
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
                           // ); //);//);
                            //}
                             ); },
                          // ),
                          //),
                        );
                      }
                    })));
  }
}