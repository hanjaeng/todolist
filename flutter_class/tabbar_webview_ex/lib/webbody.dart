import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebBody extends StatefulWidget {
  final String siteName;                           //
  const WebBody({super.key, required this.siteName});  //

  @override
  State<WebBody> createState() => _WebBodyState();
}

class _WebBodyState extends State<WebBody> {
  late WebViewController controller;
  late bool isLoading;
  late String siteName;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    siteName = widget.siteName;    // 위 class의것을 가져올땐 widget을 써야함

    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(NavigationDelegate(
      onProgress: (progress) {
        isLoading= true;  //다운받는동안 돌려라
        print(progress);
        setState((){});
        },
        onPageStarted: (url) {
        isLoading= true;  //돌려라
        setState((){});
        },
        onPageFinished: (url) {
        isLoading= false;  // 돌려라
        setState((){});
        },
        onWebResourceError: (error) {
        isLoading= false;  // 에러난동안 돌려라
        setState((){});
        },
    ))..loadRequest(Uri.parse("https://www.$siteName.com"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          isLoading
          ? const Center(//true라는건 아직 안가져온상태
            child: CircularProgressIndicator(),
          )    
          :WebViewWidget(
            controller: controller,
          )
        ],     
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.error,
        foregroundColor: Theme.of(context).colorScheme.onError,
        onPressed: () => backProcess(context),
        child: const Icon(Icons.arrow_back),
      )

    );
  }
  backProcess(context) async{  //다 받기전데  back 하기위해  async 
    if(await controller.canGoBack()) {
      controller.goBack();
    }
  }
}