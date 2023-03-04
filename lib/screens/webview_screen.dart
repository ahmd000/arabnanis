import 'package:flutter/material.dart';
import 'package:arabnanis/helpers/fb_notifications.dart';
import 'package:arabnanis/helpers/helpers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../configers/images_config.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> with Helpers {
  @override
  void initState() {
    super.initState();
    isLoading = true;

  }

  late WebViewController controller;
 late bool isLoading  ;
  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final differences = DateTime.now().difference(timeBackPressed);
        final isExitWarning = differences >= const Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          }

          const msg = "נא ללחוץ שוב בכדי לצאת מהאפליקציה!";
          print(msg);
          showSnackBar(context: context, message: msg, error: false);
          return false;
        } else {
          print("להתראות");
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0x3e8e8e8),
        body: SafeArea(
          child: Stack(
            children: [
              isLoading == false
                  ? Container()
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              Container(
                // padding: EdgeInsets.symmetric(
                //   vertical: 16.sp,
                // ),
                child: WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: main_page,
                    onPageStarted: (s) {

                      setState(() {
                        isLoading = true;
                      });
                    },
                    onPageFinished: (f) {
                      setState(() {
                        isLoading = false;
                      });
                    },
                    onWebViewCreated: (controller) {
                      this.controller = controller;
                    },
                    zoomEnabled: true,
                    initialMediaPlaybackPolicy:
                        AutoMediaPlaybackPolicy.always_allow,
                    allowsInlineMediaPlayback: true,
                    debuggingEnabled: false,
                    gestureNavigationEnabled: true,
                    navigationDelegate: (NavigationRequest request) {
                      if (request.url.startsWith("https://wa.me/")) {
                        print(request.url);
                        launchUrl(Uri.parse(request.url));
                        return NavigationDecision.prevent;
                      } else if (request.url.contains("twitter")) {
                        launchUrl(Uri.parse(request.url));
                        return NavigationDecision.prevent;
                      } else if (request.url.contains("instagram")) {
                        launchUrl(Uri.parse(request.url));
                        return NavigationDecision.prevent;
                      } else if (request.url.contains("snapchat")) {
                        launchUrl(Uri.parse(request.url));
                        return NavigationDecision.prevent;
                      } else {
                        return NavigationDecision.navigate;
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
