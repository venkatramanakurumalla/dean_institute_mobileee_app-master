import 'package:dean_institute_mobile_app/pages/home_page.dart';
import 'package:dean_institute_mobile_app/utility/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategorySelector extends StatelessWidget {
  const CategorySelector({Key? key}) : super(key: key);

  static const List<String> _items = [
    "Programming",
    "Algebra",
    "UI/UX",
    "Front End",
    "Trigonometry",
    "Calculus",
    "Accounting",
    "Life Skills",
    "Software Testing",
    "All Maths",
    "Economics",
    "Backend",
    "Mobile App",
    "US History",
    "Science",
    "Arts & Humanities",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "What are you interested in?",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.sp,
                  wordSpacing: 4,
                ),
              ),
              Expanded(
                child: GridView.count(
                  childAspectRatio: 3,
                  primary: false,
                  padding: EdgeInsets.only(top: 20.h),
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(_items.length, (index) {
                    return new CategorySelectorItem(text: _items[index]);
                  }),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage())
                      );
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.lato(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            left: 36.w, right: 36.w, top: 16.h, bottom: 16.h)),
                    child: Text(
                      "Next",
                      style: GoogleFonts.lato(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategorySelectorItem extends StatefulWidget {
  final String text;
  const CategorySelectorItem({Key? key, required this.text}) : super(key: key);

  @override
  _CategorySelectorItemState createState() => _CategorySelectorItemState();
}

class _CategorySelectorItemState extends State<CategorySelectorItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Center(
          child: Text(
            widget.text,
            style: GoogleFonts.poppins(
                color: isSelected ? Palette.palette : Colors.grey,
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            border: Border.all(
              color: isSelected ? Palette.palette : Colors.grey,
            )),
      ),
    );
  }
}
