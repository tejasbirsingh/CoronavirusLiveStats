import 'dart:convert';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class details extends StatefulWidget {
  final String Country;


  const details({Key key, @required this.Country}) : super(key: key);

  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> with SingleTickerProviderStateMixin{
  List values;
  AnimationController controller;
  Animation<double> animation;
  var data;

  Future Response() async {
    String url2 =
        'https://covid19.mathdro.id/api/countries/' + widget.Country.toString();
    var response = await http
        .get(Uri.encodeFull(url2), headers: {"Accept": "application/json"});
    print(response);
    this.setState(() {
      data = json.decode(response.body);
//      print(data);
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    this.Response();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    controller.forward();

  }

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
            icon: Icon(Icons.arrow_back_ios,
            ),
            onPressed: ()=>Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text(
            widget.Country,
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),
        ),
        body: Column(
    children: <Widget>[
        data == null ? _loading(): value()
    ],
    ));
  }
Widget _loading(){
    return Center(
      child:Container(
          height: 80.0,
          width: 80.0,
          child:FlareActor(
              'images/yellowLoading.flr',
              animation:'loading'
          )
      ),
    );
}
  Widget value() {
    var x = data['confirmed']['value'];
    var y = data['recovered']['value'];
    var z = data['deaths']['value'];
    return Padding(
      padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
      child: ScaleTransition(
        scale: animation,
        child: Column(


          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(width: 10.0,),
                Container(
                    padding: EdgeInsets.all(15.0),
                    height: 150.0,
                    width: MediaQuery.of(context).size.width / 3 + 20.0,
                    decoration:  BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.green.withOpacity(0.2),Colors.blue.shade200.withOpacity(0.4)]
                      ),
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child:        Column(          mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        x == null
                            ? Container()
                            : Text(
                          x.toString(),
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          'Confirmed Cases',
                          style: TextStyle(
                              color: Colors.black,

                              fontSize: 15.0
                          ),
                        ),
                      ],
                    )
                ),

              ],
            ),
   SizedBox(height: 10.0,),
   Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: <Widget>[
         Container(
             padding: EdgeInsets.all(15.0),
             height: 150.0,
             width: MediaQuery.of(context).size.width / 3 + 20.0,
             decoration:BoxDecoration(
               gradient: LinearGradient(
                   colors: [Colors.green.withOpacity(0.2),Colors.blue.shade200.withOpacity(0.4)]
               ),
               borderRadius: BorderRadius.circular(80.0),
             ),
             child:        Column(          mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 y == null
                     ? Container()
                     : Text(
                   y.toString(),
                   style: TextStyle(
                       color: Colors.green,
                       fontWeight: FontWeight.bold,
                       fontSize: 20.0),
                 ),
                 SizedBox(height: 10.0,),
                 Text(
                   'Recovered',
                   style: TextStyle(
                       color: Colors.black,

                       fontSize: 15.0
                   ),
                 ),
               ],
             )
         ),

         Container(
             padding: EdgeInsets.all(15.0),
             height: 150.0,
             width: MediaQuery.of(context).size.width / 3 + 20.0,
             decoration: BoxDecoration(
               gradient: LinearGradient(
                   colors: [Colors.green.withOpacity(0.2),Colors.blue.shade200.withOpacity(0.4)]
               ),
               borderRadius: BorderRadius.circular(80.0),
             ),
             child:        Column(          mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 z == null
                     ? Container()
                     : Text(
                   z.toString(),
                   style: TextStyle(
                       color: Colors.red,
                       fontWeight: FontWeight.bold,
                       fontSize: 20.0),
                 ),
                 SizedBox(height: 10.0,),
                 Text(
                   'Deaths',
                   style: TextStyle(
                       color: Colors.black,

                       fontSize: 15.0
                   ),
                 ),
               ],
             )
         ),
     ],
   ),
            SizedBox(height: 40.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                data['lastUpdate'].toString() == null
                    ? Container()
                    : Text(
                  data['lastUpdate'].toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  'Last Updated',
                  style: TextStyle(
                      color: Colors.black,

                      fontSize: 15.0
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
