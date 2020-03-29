
import 'package:covidtrackerph/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:covidtrackerph/dashboardata/dashboardservices.dart'
    as dashboardservices;

import 'dashboardata/classfiles/globalcases.dart';
import 'dashboardata/classfiles/phcases.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

  
  final subTitleHeader = Text('stay at home pipz . keep safe',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 10.0,
              ),
           );

             final subTitleHeader2 = Text('please wait, data is being prepared...',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 10.0,
              ),
           );


class SplashScreenFull extends StatefulWidget {
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenFull> {
   List<double> deathCaseCountListTimeLine=[];
   List<double> recoveredCaseCountListTimeLine=[];

    Future<PHCases> futurePHCases;
    Future<GlobalCases> futureGlobalCases;
  String confirmedCasesCount,
  recoveredCasesCount,
  deathCasesCount,
  activeCasesCount,
  todaysCasesCount,
  critcalCount,
  todaysDeathCount,
  casePerOneMillion,
  deathsPerOneMillion;

  String globalConfirmedCasesCount,
  globalRecoveredCasesCount,
  globalDeathCasesCount,
  globalActiveCases;

    Future<void> fetchDeathCaseCountTimeLine() async{
  
    String url = "https://covid2019-api.herokuapp.com/timeseries/deaths";
    final response = await http.get(url);
    final decoded = json.decode(response.body) as Map;
    
    final data = decoded['deaths'][182] as Map;
   
   for(final d in data.keys){
     if(d.toString().trim() == "Province/State" || 
     d.toString().trim() == "Country/Region"  ||
     d.toString().trim() == "Lat" ||
     d.toString().trim() == "Long" ||
     d.toString().trim() == "0"
     ){
       continue;
     }else{
       deathCaseCountListTimeLine.add(double.parse(data[d]));
   
     }
      
   }
    }

       Future<void> fetchRecoveredCaseCountTimeLine() async{

    String url = "https://covid2019-api.herokuapp.com/timeseries/recovered";
    final response = await http.get(url);
    final decoded = json.decode(response.body) as Map;
    
    final data = decoded['recovered'][179] as Map;

   for(final d in data.keys){
     if(d.toString().trim() == "Province/State" || 
     d.toString().trim() == "Country/Region"  ||
     d.toString().trim() == "Lat" ||
     d.toString().trim() == "Long" ||
     d.toString().trim() == "0"
     ){
       continue;
     }else{
       recoveredCaseCountListTimeLine.add(double.parse(data[d]));
       
       
     }
      
   }
    }


  @override
  void initState() {

    super.initState();
    fetchDeathCaseCountTimeLine();
    fetchRecoveredCaseCountTimeLine();
    futurePHCases = dashboardservices.getPHCases();
    futurePHCases.then((u) {
      setState(() {
          confirmedCasesCount = u.cases;
          recoveredCasesCount = u.recovered;
          deathCasesCount = u.deaths;
          activeCasesCount = u.active;
          todaysCasesCount = u.todayCases;
          critcalCount = u.critical;
          todaysDeathCount = u.todaysDeath;
          casePerOneMillion = u.casePerOneMillion;
          deathsPerOneMillion = u.deathsPerOneMillion;
      });
    });

    futureGlobalCases = dashboardservices.getGlobalCases();
    futureGlobalCases.then((g){
        setState(() {
          globalConfirmedCasesCount = g.cases;
          globalRecoveredCasesCount = g.recovered;
          globalDeathCasesCount = g.deaths;
          globalActiveCases = g.activeCases;
        });
    });

    Future.delayed(Duration(
      seconds: 10
      ),(){


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  DashBoard(
        confirmedCasesCount: confirmedCasesCount,
        recoveredCasesCount: recoveredCasesCount,
        deathCasesCount: deathCasesCount,
        activeCasesCount: activeCasesCount,
        todaysDeathCount: todaysDeathCount,
        todaysCasesCount: todaysCasesCount,
        critcalCount: critcalCount,
        casePerOneMillion: casePerOneMillion,
        deathsPerOneMillion: deathsPerOneMillion,
        globalConfirmedCasesCount: globalConfirmedCasesCount,
        globalRecoveredCasesCount: globalRecoveredCasesCount,
        globalDeathCasesCount: globalDeathCasesCount,
        globalActiveCasesCount: globalActiveCases,
        caseNum: deathCaseCountListTimeLine,
        caseNumRecovered: recoveredCaseCountListTimeLine,
      )));
        
     }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
            
              Center(
                child: Text("CORONA VIRUS TRACKER",style: TextStyle(fontSize: 20,color: Colors.white),)
              ),
        
            SizedBox(height: 5.0,),
            Center(
              child: subTitleHeader
            ),
            SizedBox(height: 10.0,),
            Center(
              child: subTitleHeader2
            ),
          ],
        ),
    );
  }
}