import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConfirmedCases extends StatefulWidget {
  @override
  _ConfirmedCasesState createState() => _ConfirmedCasesState();
}

class _ConfirmedCasesState extends State<ConfirmedCases> {




  String urlCities =
      "https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/PH_masterlist/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&groupByFieldsForStatistics=residence&orderByFields=value%20desc&outStatistics=%5B%7B%22statisticType%22%3A%22count%22%2C%22onStatisticField%22%3A%22FID%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&outSR=102100&cacheHint=true";
  
  String urlHospitals = "https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/conf_fac_tracking/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outSR=102100&resultOffset=0&resultRecordCount=200&cacheHint=true";
  Future<List<FeaturesDataCityCase>>cityConfirmedCases() async {
    List<FeaturesDataCityCase> listCity;
    final response = await http.get(urlCities);

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final data = decoded['features'] as List;
      listCity = data.map<FeaturesDataCityCase>((json)=>FeaturesDataCityCase.fromJson(json)).toList();
    }


    return listCity;
  }

    Future<List<FeaturesDataHospitalCase>>facilityConfirmedCases() async {
      List<FeaturesDataHospitalCase> listFacility;
    final response = await http.get(urlHospitals);

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final data = decoded['features'] as List;

      listFacility = data.map<FeaturesDataHospitalCase>((json)=>FeaturesDataHospitalCase.fromJson(json)).toList();
    }


    return listFacility;
  }

    Widget listViewWidgetHospitals(List<FeaturesDataHospitalCase> features) {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount: features.length,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return ListTile(
              
                title: Text(
                  '${features[position].attribDataFacility.facility}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Regular'
                      ),
                ),
                subtitle: Text(
                  '${features[position].attribDataFacility.value}',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Bold'
                      ),
                ),
               
              );
            //);
          }),
    );
  }

  Widget listViewWidgetCities(List<FeaturesDataCityCase> features) {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount: features.length,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return ListTile(
              
                title: Text(
                  '${features[position].attribData.residence}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Regular'
                      ),
                ),
                subtitle: Text(
                  '${features[position].attribData.value}',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Bold'
                      ),
                ),
               
              );
            //);
          }),
    );
  }

List<FeaturesDataCityCase> listCity = List();
List<FeaturesDataHospitalCase> listFacility = List();
List<FeaturesDataCityCase> filteredListCity = List();
List<FeaturesDataHospitalCase> filteredListFacility = List();


@override
void initState() { 
  super.initState();
  cityConfirmedCases().then((fromCityConfirmedCase){
    setState(() {
         listCity = fromCityConfirmedCase;
        filteredListCity = listCity  ;
    });
  });

  facilityConfirmedCases().then((fromFacilityConfirmedCase){
    setState(() {
      listFacility = fromFacilityConfirmedCase;
      filteredListFacility = listFacility;
    });
  });
}

final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
          child: Scaffold(
            backgroundColor: Color(0xFF121212),
        appBar: AppBar(

          title: Text(
            "CONFIRMED CASES",
            style: TextStyle(fontFamily: 'Montserrat-Bold'),
          ),
          centerTitle: true,
          bottom: TabBar(
          labelColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.w600,),
          indicatorColor: Colors.white,
         indicatorWeight: 5,
          tabs: [
          
            Tab(
              text: "CITIES",

            ),
            Tab(
              text: "HEALTH FACILITIES",
            )
          ],
        ),
        ),
        body:  TabBarView(
          children: [
               Container(

          child: Column(
            children: <Widget>[
                   TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Search City...',
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filteredListCity = listCity
                      .where((u) => (u.attribData.residence
                              .toLowerCase()
                              .contains(string.toLowerCase())
                      )).toList();
                });
              });
            },
          ),

          Expanded(
            child:      FutureBuilder(
            future: cityConfirmedCases(),
            builder: (context, snapshots){
                return snapshots.data != null ? listViewWidgetCities(filteredListCity) : Center(child: CircularProgressIndicator(backgroundColor: Colors.blueGrey[200],));
            }
          ),
          )
              
            ],
          )
          
     
        ),
        Container(
          child: Column(
            children: <Widget>[
                        TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Search health facility...',
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filteredListFacility = listFacility
                      .where((u) => (u.attribDataFacility.facility
                              .toLowerCase()
                              .contains(string.toLowerCase())
                      )).toList();
                });
              });
            },
          ),

          Expanded(
            child:FutureBuilder(
            future: facilityConfirmedCases(),
            builder: (context, snapshots){
                return snapshots.data != null ? listViewWidgetHospitals(filteredListFacility) : Center(child: CircularProgressIndicator(backgroundColor: Colors.blueGrey[200],));
            }
          ),
          )
          ],
        )
          
          
          

        ),
          ],
        ),
        
     
      ),
    );
  }
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
class FeaturesDataCityCase{
  AttribData attribData;

  FeaturesDataCityCase({this.attribData});

     factory  FeaturesDataCityCase.fromJson(Map<String, dynamic> json) {
    return  FeaturesDataCityCase(
          attribData: AttribData.fromJson(json['attributes'])
      );
  }
}


class FeaturesDataHospitalCase{
 AttribDataFacility attribDataFacility;

  FeaturesDataHospitalCase({this.attribDataFacility});

     factory  FeaturesDataHospitalCase.fromJson(Map<String, dynamic> json) {
    return  FeaturesDataHospitalCase(
          attribDataFacility: AttribDataFacility.fromJson(json['attributes'])
      );
  }
}


class AttribDataFacility {
  String value;
  String facility;

  AttribDataFacility({this.value, this.facility});

  factory AttribDataFacility.fromJson(Map<String, dynamic> json) {
    return AttribDataFacility(
        value: json['count_'].toString(),
        facility: json['facility'].toString());
  }
}
class AttribData {
  String value;
  String residence;

  AttribData({this.value, this.residence});

  factory AttribData.fromJson(Map<String, dynamic> json) {
    return AttribData(
        value: json['value'].toString(),
        residence: json['residence'].toString());
  }
}
