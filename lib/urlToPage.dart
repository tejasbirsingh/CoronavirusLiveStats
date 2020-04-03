


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class urlToPage extends StatefulWidget {
  final String url;

  const urlToPage({Key key, this.url}) : super(key: key);
  @override
  _urlToPageState createState() => _urlToPageState();
}

class _urlToPageState extends State<urlToPage> {
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(

                    colors:
                    [
                      Colors.green.shade300,
                      Colors.blue.shade600,
                      Colors.blue.shade700
                    ]
                )
            ),
          ),
        leading: IconButton(

          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title:Text('Covid-19 News')
      ),
      body: WebView(
        initialUrl: widget.url,
        onWebViewCreated:(WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
    );
  }
}
