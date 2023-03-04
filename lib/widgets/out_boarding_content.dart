import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutBoardingContent extends StatelessWidget {
  const OutBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 330.w,
            height: 330.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color(0xffcd4887),
                fontFamily: 'Nunito',
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Nunito', fontSize: 20, color: Colors.black),
                // fontFamily: 'Nunito', fontSize: 20, color: Color(0xffe9549a)),
          ),
        ],
      ),
    );
  }
}
