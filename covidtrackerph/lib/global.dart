import 'dart:async';

import 'package:flutter/material.dart';

import 'globalclass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}



Future<List<Country>> getData() async{
  List<Country>list;

  String link = "https://corona.lmao.ninja/countries";
  var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
   if (res.statusCode == 200) {
        var data = json.decode(res.body);
       
        
        list = data.map<Country>((json) => Country.fromJson(json)).toList();
        
      }
   
    return list;
}

Widget listViewWidget(List<Country> country) {
    return Container(
   
      child: ListView.builder(
          itemCount: country.length,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return Card(
              elevation: 0,
              child: ListTile(
                title: Text(
                  '${country[position].countryName}',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Regular'
                      ),
                ),
                
                leading: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    child: country[position].countryInfo.flag == null
                        ? Text("")
                        : Image.network('${country[position].countryInfo.flag}'),
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
              subtitle: Text("Cases : ${country[position].allCases} | Deaths : ${country[position].deathCase}\nRecovered : ${country[position].recoveredCase}"),
              ),
            );
          }),
    );
  }
class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;
 
  Debouncer({this.milliseconds});
 
  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _GlobalState extends State<Global> {
List<Country> countryList = List();
List<Country> filteredCountryList = List();
final _debouncer = Debouncer(milliseconds: 500);
  @override
  void initState() { 
    super.initState();
    getData().then((countryFromList){
        setState(() {
          countryList = countryFromList;
          filteredCountryList = countryList;
        });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
          "GLOBAL CASES",
          style: TextStyle(fontFamily: 'Montserrat-Bold'),
        ),
        centerTitle: true,
      ),
        body: Column(
          children: <Widget>[
              TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Search country...',
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filteredCountryList = countryList
                      .where((u) => (u.countryName
                              .toLowerCase()
                              .contains(string.toLowerCase())
                      )).toList();
                });
              });
            },
          ),

          Expanded(
            child:                 FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              return snapshot.data != null
                  ? listViewWidget(filteredCountryList)
                  : Center(child: CircularProgressIndicator());
            }),
          )
          ],
        )
        
        
        // Stack(
        //   children: <Widget>[
        
  
        //   ],
              
        // ),
    );
  }
}