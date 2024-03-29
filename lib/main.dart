import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/out_boarding_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/webview_screen.dart';

int? isviewed;
int? initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPrefController().initSharedPref();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            builder: (context, widget) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: widget!,
              );
            },
            // initialRoute: '/splash_screen',
            initialRoute:// initScreen == 0 || initScreen == null
                 "/splash_screen"
              //  : "/web_view_screen",
        ,    routes: {
              '/splash_screen': (context) => const SplashScreen(),
              '/web_view_screen': (context) => const WebViewScreen(),
            },
          );
        });
  }
}
