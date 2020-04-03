import 'dart:convert';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:webSCrapper/InNewsPage.dart';
import 'package:webSCrapper/details.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TextEditingController countryController;

  List list = [];
  String _selected;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController search = TextEditingController();
  List data = List();

  String country;
  var data2;
  var us;
  var ind;
  var it;
  var ch;
  var spain;
  List values;

  String url = 'https://covid-19.mathdro.id/api/countries';

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;

  Future usData() async {
    String url2 = 'https://covid19.mathdro.id/api/countries/us';
    var response = await http
        .get(Uri.encodeFull(url2), headers: {"Accept": "application/json"});
    print(response);
    this.setState(() {
      us = json.decode(response.body);
//      print(data);
    });
    return us;
  }

  Future spData() async {
    String url2 = 'https://covid19.mathdro.id/api/countries/spain';
    var response = await http
        .get(Uri.encodeFull(url2), headers: {"Accept": "application/json"});
    print(response);
    this.setState(() {
      spain = json.decode(response.body);
//      print(data);
    });
    return spain;
  }

  Future indData() async {
    String url2 = 'https://covid19.mathdro.id/api/countries/india';
    var response = await http
        .get(Uri.encodeFull(url2), headers: {"Accept": "application/json"});
    print(response);
    this.setState(() {
      ind = json.decode(response.body);
//      print(data);
    });
    return ind;
  }

  Future itData() async {
    String url2 = 'https://covid19.mathdro.id/api/countries/italy';
    var response = await http
        .get(Uri.encodeFull(url2), headers: {"Accept": "application/json"});
    print(response);
    this.setState(() {
      it = json.decode(response.body);
//      print(data);
    });
    return it;
  }

  Future chData() async {
    String url2 = 'https://covid19.mathdro.id/api/countries/china';
    var response = await http
        .get(Uri.encodeFull(url2), headers: {"Accept": "application/json"});
    print(response);
    this.setState(() {
      ch = json.decode(response.body);
//      print(data);
    });
    return ch;
  }

  Future Response() async {
    String url2 = 'https://covid-19.mathdro.id/api';
    var response = await http
        .get(Uri.encodeFull(url2), headers: {"Accept": "application/json"});
    print(response);
    this.setState(() {
      data2 = json.decode(response.body);

//      print(data2);
    });
    return data2;
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
    this.Response();
    this.usData();
    this.indData();
    this.itData();
    this.chData();
    this.spData();

    countryController = TextEditingController();

//  this.Response('india');
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
//    print(response.body);

    var convertData = json.decode(response.body);
    setState(() {
      data = convertData['countries'];

      print(data);
      for (int i = 0; i < data.length; i++) {
        //  print(data[i]['name']);
        if (data != null) {
          list.add(data[i]['name']);
//          list.add(data[i]['iso2']);

        } //   list2.add(data[i]['iso2']);

      }
      print(list);
//    print(list2);
    });

    return "Success";
  }

  Widget SpainCountry() {
    var x = spain['confirmed']['value'];
    var y = spain['recovered']['value'];
    var z = spain['deaths']['value'];
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Spain',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    stats('Confirmed', x.toString(), Colors.blue),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Recovererd', y.toString(), Colors.green),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Deaths', z.toString(), Colors.red)
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
//            _searchbar()
        ],
      ),
    );
  }

  Widget UsCountry() {
    var x = us['confirmed']['value'];
    var y = us['recovered']['value'];
    var z = us['deaths']['value'];
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'United States',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    stats('Confirmed', x.toString(), Colors.blue),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Recovererd', y.toString(), Colors.green),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Deaths', z.toString(), Colors.red)
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
//            _searchbar()
        ],
      ),
    );
  }

  Widget indCountry() {
    var x = ind['confirmed']['value'];
    var y = ind['recovered']['value'];
    var z = ind['deaths']['value'];
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'India',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    stats('Confirmed', x.toString(), Colors.blue),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Recovererd', y.toString(), Colors.green),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Deaths', z.toString(), Colors.red)
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
//            _searchbar()
        ],
      ),
    );
  }

  Widget itCountry() {
    var x = it['confirmed']['value'];
    var y = it['recovered']['value'];
    var z = it['deaths']['value'];
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Italy',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    stats('Confirmed', x.toString(), Colors.blue),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Recovererd', y.toString(), Colors.green),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Deaths', z.toString(), Colors.red)
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
//            _searchbar()
        ],
      ),
    );
  }

  Widget chCountry() {
    var x = ch['confirmed']['value'];
    var y = ch['recovered']['value'];
    var z = ch['deaths']['value'];
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'China',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    stats('Confirmed', x.toString(), Colors.blue),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Recovererd', y.toString(), Colors.green),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Deaths', z.toString(), Colors.red)
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
//            _searchbar()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              infoAlert(context);
            },
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 30.0,
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.green.shade300,
            Colors.blue.shade600,
            Colors.blue.shade700
          ])),
        ),
        centerTitle: true,
        title: Text('Coronavirus Live Data'),
      ),
      drawer: ClipRect(
        child: _buildDrawer(),
      ),
      body: data2 == null
          ? Center(
        child: Container(
            height: 80.0,
            width: 80.0,
            child: FlareActor('images/yellowLoading.flr',
                animation: 'loading')),
      )
          :Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.15)),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child:  world(),
                  ),
                  Center(
                    child: Container(
                      child: data == null
                          ? Container()
                          : DropdownButton(
                              items: data.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item['name'].toString()),
                                  value: item['name'].toString(),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _selected = val;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        details(Country: val)));
                              },
                              hint: Text('Select  Country'),
                              value: _selected,
                            ),
//                child: ListView.builder(
//
//                    itemCount: data == null ? 0 : data.length,
//                    itemBuilder: (BuildContext context, int index) {
//                      return _listview(index);
//                    }),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                 data == null ? Container() : Column(
                   children: <Widget>[
                     it == null ? Container() : indCountry(),
                     us == null ? Container() : UsCountry(),
                     ind == null ? Container() : itCountry(),
                     ch == null ? Container() : chCountry(),
                     spain == null ? Container() : SpainCountry(),
                   ],
                 )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //  Widget _listview(index) {
//    return Padding(
//        padding: EdgeInsets.all(5.0),
//        child: GestureDetector(
//          onTap: () {
//            Navigator.of(context).push(MaterialPageRoute(
//                builder: (BuildContext context) =>
//                    details(Country: data[index]['name'])));
//          },
//          child: Container(
//              height: 50.0,
//              child: Card(
//                  elevation: 5.0,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(10.0)),
//                  child: Center(
//                    child: Text(data[index]['name']),
//                  ))),
//        ));
//  }
  Future<void> infoAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Help',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 6 - 50.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(40.0)),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('Live News by swiping right'),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(40.0)),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Flexible(
                          child: Text(
                              'Any Country can be selected from dropdown for checking its Covid-19 data'))
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildDrawer() {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.green.withOpacity(0.3),
            Colors.blue.shade200.withOpacity(0.4),
            Colors.blue.shade200.withOpacity(0.6)
          ])),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: active,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.deepOrange])),
                    child: CircleAvatar(
                      radius: 40,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "Live News ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30.0),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => IndiaNews(
                                      Country: "India",
                                      url:
                                          'http://newsapi.org/v2/top-headlines?country=in&apiKey=d7483ff37a4b4490abe62dcd7153430a',
                                    )));
                      },
                      child: _buildRow(Icons.open_in_new, "India News")),
                  _buildDivider(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => IndiaNews(
                                      Country: "Italy",
                                      url:
                                          'http://newsapi.org/v2/top-headlines?country=it&apiKey=d7483ff37a4b4490abe62dcd7153430a',
                                    )));
                      },
                      child: _buildRow(Icons.open_in_new, "Italy News")),
                  _buildDivider(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => IndiaNews(
                                      Country: "Australia",
                                      url:
                                          'http://newsapi.org/v2/top-headlines?country=au&apiKey=d7483ff37a4b4490abe62dcd7153430a',
                                    )));
                      },
                      child: _buildRow(Icons.open_in_new, "Australia News")),
                  _buildDivider(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => IndiaNews(
                                      Country: "United States",
                                      url:
                                          'http://newsapi.org/v2/top-headlines?country=us&apiKey=d7483ff37a4b4490abe62dcd7153430a',
                                    )));
                      },
                      child:
                          _buildRow(Icons.open_in_new, "United States News")),
                  _buildDivider(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => IndiaNews(
                                      Country: "Germany",
                                      url:
                                          'http://newsapi.org/v2/top-headlines?country=de&apiKey=d7483ff37a4b4490abe62dcd7153430a',
                                    )));
                      },
                      child: _buildRow(Icons.open_in_new, "Germany News")),
                  _buildDivider(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => IndiaNews(
                                      Country: "Canada",
                                      url:
                                          'http://newsapi.org/v2/top-headlines?country=ca&apiKey=d7483ff37a4b4490abe62dcd7153430a',
                                    )));
                      },
                      child: _buildRow(Icons.open_in_new, "Canada News")),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.black38,
    );
  }

  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Icon(
          icon,
          color: active,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
        Spacer(),
      ]),
    );
  }

//  Widget _searchbar() {
//    return Container(
//      padding: EdgeInsets.only(left: 20.0, right: 20.0),
//      child: SingleChildScrollView(
//        child: Form(
//          key: _formKey,
//          child: TextFormField(
//            controller: countryController,
//            onFieldSubmitted: (val) {
//              if (_formKey.currentState.validate()) {
//                Navigator.of(context).push(MaterialPageRoute(
//                    builder: (BuildContext context) => details(
//                          Country: country,
//                        )));
//              }
//              countryController.clear();
//            },
//            textInputAction: TextInputAction.search,
//            validator: (val) {
//              if (val.length == 0 || !list.contains(country)) {
//                return 'Enter the country name';
//              } else {
//                return null;
//              }
//            },
//            onChanged: (val) {
//              country = capitalize(val);
//            },
//            autofocus: false,
//            keyboardType: TextInputType.text,
//            decoration: InputDecoration(
//              suffixIcon: IconButton(
//                icon: Icon(Icons.search),
//                onPressed: () {
//                  if (_formKey.currentState.validate()) {
//                    Navigator.of(context).push(MaterialPageRoute(
//                        builder: (BuildContext context) => details(
//                              Country: country,
//                            )));
//                  }
//                  countryController.clear();
//                },
//              ),
//              fillColor: Colors.white30,
//              filled: true,
//              border:
//                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
//              hintText: 'Search by Country',
//            ),
//          ),
//        ),
//      ),
//    );
//  }

  Widget world() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.globe,
                      size: 40.0,
                    ),
                    Text(
                      'COVID-19 Stats for World',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    stats('Confirmed', data2['confirmed']['value'].toString(),
                        Colors.blue),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Recovererd', data2['recovered']['value'].toString(),
                        Colors.green),
                    SizedBox(
                      width: 5.0,
                    ),
                    stats('Deaths', data2['deaths']['value'].toString(),
                        Colors.red)
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
//            _searchbar()
        ],
      ),
    );
  }

  Widget stats(String title, String val, Color color) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.green.withOpacity(0.2),
          Colors.blue.shade200.withOpacity(0.4)
        ]),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Text(
            val,
            style: TextStyle(
                fontSize: 20.0, color: color, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

//  Widget _listview(index) {

//
//    return ListTile(
//
//      trailing: Icon(Icons.navigate_next),
//      onTap: () {
//        Navigator.of(context).push(MaterialPageRoute(
//            builder: (BuildContext context) =>
//                details(Country: data[index]['name'])));
//      },
//      title: Center(child: Text(data[index]['name'])),
//    );

//  }

}
