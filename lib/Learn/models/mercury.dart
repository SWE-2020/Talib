import 'package:flutter/material.dart';
import 'package:flutter_tutorial/Learn/models/sun.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Mercury extends StatefulWidget {
  const Mercury({super.key});

  @override
  State<Mercury> createState() => _MercuryState();
}

class _MercuryState extends State<Mercury> {
  WebViewController controller=WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.google.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://en.wikipedia.org/wiki/Mars'));


  @override
  Scaffold build(BuildContext context) {
    return Scaffold (

     // appBar: Sun.appBar,
      body: SafeArea(
          child: WebViewWidget(controller: controller,)),
    );
  }
}
