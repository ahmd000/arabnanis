// import 'package:arabnanis/prefs/shared_pref_controller.dart';
// import 'package:arabnanis/widgets/out_boarding_content.dart';
// import 'package:arabnanis/widgets/out_boarding_indicator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
//
//
// class OutBoardingScreen extends StatefulWidget {
//   const OutBoardingScreen({Key? key}) : super(key: key);
//
//   @override
//   _OutBoardingScreenState createState() => _OutBoardingScreenState();
// }
//
// class _OutBoardingScreenState extends State<OutBoardingScreen> {
//
//   late PageController _pageController;
//   int _currentPage = 0;
//   late int isViewed;
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _pageController = PageController();
//     _storeOnboardInfo();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   // Future<void>_storeOnboardInfo() async {
//   //   print("Shared pref called");
//   //   // bool isViewed = false;
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   await prefs.setInt('onBoard', isViewed);
//   //   print(prefs.getInt('onBoard'));
//   // }
//
//   Future<void>_storeOnboardInfo() async {
//     print("Shared pref called");
//     // bool isViewed = false;
//     await SharedPrefController().initSharedPref();
//     SharedPrefController().loggedIn;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Align(
//             alignment: AlignmentDirectional.topEnd,
//             child: Visibility(
//               visible: _currentPage < 2,
//               maintainSize: true,
//               maintainState: true,
//               maintainAnimation: true,
//               child: TextButton(
//                 onPressed: () => _pageController.animateToPage(2,
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.easeInOut),
//                 child: Text(
//                   'Arab Nanis',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Nunito',
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w600,
//                     color: const Color(0xffcd4887),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           ConstrainedBox(
//             constraints: BoxConstraints(
//               minWidth: 0.w,
//               maxWidth: double.infinity,
//               minHeight: 0.h,
//               maxHeight: 580.h,
//             ),
//             child: PageView(
//               controller: _pageController,
//               scrollDirection: Axis.horizontal,
//               onPageChanged: (value) {
//                 setState(() {
//                   _currentPage = value;
//                 });
//               },
//               children: const [
//                 OutBoardingContent(
//                   image: 'assets/images/out_boarding_image1.png',
//                   title: 'תודה שהתקנת את האפליקציה שלנו',
//                   description:
//                       'אנחנו נרגשים להציג לך את האפליקציה שלנו . מהיום אפשר לעשות הזמנה לכל מה שהעסק שלך צריך בלחיצת כפתור !',
//                 ),
//                 OutBoardingContent(
//                   image: 'assets/images/out_boarding_image2.png',
//                   title: 'הכל לעסק שלך!',
//                   description:
//                       'אנחנו גאים להציג לכם את את שלל המוצרים שאנחנו משווקים . תוכלו לבצע הזמנה בכמה צעדים פשוטים',
//                 ),
//                 OutBoardingContent(
//                   image: 'assets/images/out_boarding_image3.png',
//                   title: 'ההזמנה בדרך אליך!',
//                   description:
//                       'לאחר ביצוע ההזמנה , אנחנו נדאג להכין ולארגן את ההזמנה ולשלוח אותה עד אליך!',
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               OutBoardingIndicator(
//                 marginEnd: 10,
//                 selected: _currentPage == 0,
//               ),
//               OutBoardingIndicator(
//                 marginEnd: 10,
//                 selected: _currentPage == 1,
//               ),
//               OutBoardingIndicator(
//                 selected: _currentPage == 2,
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Visibility(
//             visible: _currentPage == 2,
//             maintainSize: true,
//             maintainState: true,
//             maintainAnimation: true,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 25.w),
//               child: ElevatedButton(
//                 onPressed: () async{
//                   // _pageController.nextPage(
//                   //   duration: const Duration(seconds: 1),
//                   //   curve: Curves.ease,
//                   // );
//                   Navigator.pushReplacementNamed(context, '/web_view_screen');
//
//                   // print(_currentPage);
//                   // if (_currentPage == 2) {
//                   //   await _storeOnboardInfo();
//                   //   Navigator.pushReplacement(context,
//                   //       MaterialPageRoute(builder: (context) => const WebViewScreen()));
//                   // }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: const Color(0xffcd4887),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(28.r)),
//                   minimumSize: Size(165.w, 56.h),
//                 ),
//                 child: Text(
//                   'התחל',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontFamily: 'Nunito',
//                       fontSize: 19.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
