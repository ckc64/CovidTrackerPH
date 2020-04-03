import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestingPage extends StatefulWidget {
  @override
  _TestingPageState createState() => _TestingPageState();
}


 String url = "https://services5.arcgis.com/mnYJ21GiFTR97WFg/arcgis/rest/services/age_group/FeatureServer/0/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&groupByFieldsForStatistics=age_categ%2Csex&outStatistics=%5B%7B%22statisticType%22%3A%22count%22%2C%22onStatisticField%22%3A%22FID%22%2C%22outStatisticFieldName%22%3A%22value%22%7D%5D&cacheHint=true";
  Future<List<FeaturesAgeCase>>ageCases() async {
    List<FeaturesAgeCase> listCity;
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final data = decoded['features'] as List;
      listCity = data.map<FeaturesAgeCase>((json)=>FeaturesAgeCase.fromJson(json)).toList();
     
    }
    
    return listCity;
  }



class _TestingPageState extends State<TestingPage> {
  List<charts.Series<Pollution, String>> _seriesData;
 _generateData() {
    var data1 = [
      new Pollution(1980, 'USA', 30),
      new Pollution(1980, 'Asia', 40),
      new Pollution(1980, 'Europe', 10),
    ];
    var data2 = [
      new Pollution(1985, 'USA', 100),
      new Pollution(1980, 'Asia', 150),
      new Pollution(1985, 'Europe', 80),
    ];
    var data3 = [
      new Pollution(1985, 'USA', 200),
      new Pollution(1980, 'Asia', 300),
      new Pollution(1985, 'Europe', 180),
    ];

    _seriesData.add(
           charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ), 
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
           charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
       fillColorFn: (Pollution pollution, _) =>
          charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );
    
 }

 final list = ageCases();


 @override
 void initState() { 
   super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();

   _generateData();
 }
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
        child:  Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'SO₂ emissions, by world region (in million tonnes)',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 5),
                            vertical: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              
      )
  );
}
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}



class FeaturesAgeCase{
 AgeCases ageCases;

  FeaturesAgeCase({this.ageCases});

     factory  FeaturesAgeCase.fromJson(Map<String, dynamic> json) {
    return  FeaturesAgeCase(
          ageCases: AgeCases.fromJson(json['attributes'])
      );
  }
}

class AgeCases{
  final String ageCategory;
  final String value;
  final String sex;

  AgeCases({this.ageCategory,this.value,this.sex});

  factory AgeCases.fromJson(Map<String, dynamic> json){
    return AgeCases(
      ageCategory: json['age_categ'],
      value:json['value'].toString(),
      sex: json['sex']
    );
  }
}