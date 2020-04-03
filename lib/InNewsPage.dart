import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webSCrapper/json_parsingNews.dart';
import 'package:webSCrapper/urlToPage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IndiaNews extends StatefulWidget {
  final String Country;
  final String  url;

  const IndiaNews({Key key, this.Country, this.url}) : super(key: key);
  @override
  _IndiaNewsState createState() => _IndiaNewsState();
}

class _IndiaNewsState extends State<IndiaNews> with SingleTickerProviderStateMixin{
List x;
News news;

AnimationController controller;
Animation<Offset> animation;
List data;
@override
void initState(){
  super.initState();
  getJsonData();

  controller = AnimationController(
      duration: const Duration(milliseconds: 600), vsync: this);
  animation = Tween<Offset>(
    begin: Offset(-1.0,0.0),
    end: Offset(0.0,0.0)
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn
  )) ;

  controller.forward();
}

//  String url = 'http://newsapi.org/v2/top-headlines?country=in&apiKey=d7483ff37a4b4490abe62dcd7153430a';
  Future getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(widget.url), headers: {"Accept": "application/json"});

//    final jsonResponse = json.decode(response.body);
//    news = new News.fromJson(jsonResponse);
//    print((news.Status).toString());
    setState(() {
      var convertData = jsonDecode(response.body);
      data = convertData['articles'];
      print(data);
    });



    return "Success";
  }
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
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(widget.Country.toString()),
      ),
      body:Stack(
        children: <Widget>[
          Container(
            color:Colors.blue.withOpacity(0.15)
          ),
          data == null ? Center(
            child: CircularProgressIndicator(),
          ) : ListView.builder(
              itemCount: data.length == null ? 0 : data.length,
              itemBuilder:(BuildContext context , int index){
                return _listView(index);
              })
        ],
      )
    );
  }

  Widget _listView(index){
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SlideTransition(
        position: animation,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(

                  colors: [Colors.green.withOpacity(0.2),Colors.blue.shade200.withOpacity(0.4)]
              )
          ),
          child: titleHas(data[index]['title'], data[index]['description']) ?  Card(
            child:  Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(

                        colors: [Colors.green.withOpacity(0.2),Colors.blue.shade200.withOpacity(0.4)]
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: <Widget>[
                    Text(data[index]['title'] == null ? ' ' :  data[index]['title'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5.0,),
                    Text(data[index]['description'] == null ? ' ' : data[index]['description']),
                    GestureDetector(child: Text('Link to news site...',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                    ),),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => urlToPage(url:data[index]['url'])
                    )))
//            Text(data[index]['content'] == null ? ' ' : data[index]['content']),
//            SizedBox(height: 10.0,)
                  ],
                ),
              ),
            ) ,
          )  : null ,

        ),
      ),
    );
  }

  bool titleHas(String data, String data2){

    var x = data.toLowerCase();
   return (x.contains('coronavirus') || x.contains('covid')||
       data2.contains('coronavirus') || data2.contains('Coronavirus')
   || data2.contains('COVID') || data2.contains('Covid-19'))  ;

  }
}

