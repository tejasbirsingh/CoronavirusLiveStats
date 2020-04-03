

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

Future initiate() async {
  var client = Client();
  Response response =
//      await client.get('https://covid-19.mathdro.id/api/countries');
  await client.get('https://www.worldometers.info/coronavirus/');
  var document = parse(response.body);

var table = document.querySelector('table');
var values = table.querySelector('tbody');
  var list = new List(table.text.length);
List<Element> val = values.querySelectorAll('tr.odd > td');

//var values = table.querySelector('tbody').querySelectorAll('tr.row');

print(values.text);

}
