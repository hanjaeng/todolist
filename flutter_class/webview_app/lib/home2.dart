import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  late WebViewController controller;
  late bool isLoading;


   @override
  void initState() {
    super.initState();
    isLoading = true; // for indicator
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        // 값 받아오기
        // 진행 중
        onProgress: (progress) {
          isLoading = true;
          print(progress);
          setState(() {});
        },
        // 시작함
        onPageStarted: (url) {
          isLoading = true;
          setState(() {});
        },
        // 종료
        onPageFinished: (url) {
          isLoading = false;
          setState(() {});
        },
        onWebResourceError: (error) {
          isLoading = false;
          setState(() {});
        },
      ))
      ..loadRequest(Uri.parse("https://www.naver.com"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
      ),
      body: Stack(
        children: [
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : WebViewWidget(
                  controller: controller,
                )
        ],
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
              onPressed: () => backProcess(context),
              child: const Icon(Icons.arrow_back),
            ),
            FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
              onPressed: () => forwardProcess(context),
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions --
  backProcess(context) async{
    if(await controller.canGoBack()){
      controller.goBack();
    }
  }
  forwardProcess(context) async{
    if(await controller.canGoForward()){
      controller.goForward();
    }
  }

} // End
