import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WebViewController controller;
  late bool isLoading; // 웹 가져왔냐 안가져왔냐 true false

  @override
  void initState() {
    super.initState();
    isLoading = true; //for indicator
    controller = WebViewController()
      // controller.setJavaScriptMode(javaScriptMode)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          isLoading = true; //다운받는동안 돌려라
          print(progress);
          setState(() {});
        },
        onPageStarted: (url) {
          //시작
          isLoading = true; //true
          setState(() {});
        },
        onPageFinished: (url) {
          // 종료
          isLoading = false; //false!
          setState(() {});
        },
        onWebResourceError: (error) {
          isLoading = false; // 에러난동안 돌려라  //false!
          setState(() {});
        },
      ))
      ..loadRequest(
          Uri.parse("https://www.naver.com")); //uri는 발신사수신자(ip)를 알고 있음
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
      ),
      body: Stack(
        children: [
          isLoading
              ? const Center(
                  //true라는건 아직 안가져온상태
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

  backProcess(context) async {
    //다 받기전에  back 하기위해  async
    if (await controller.canGoBack()) {
      controller.goBack();
    }
  }
  forwardProcess(context) async{
    if(await controller.canGoForward()){
      controller.goForward();
    }
  }
}