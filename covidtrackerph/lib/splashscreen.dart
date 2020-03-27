
import 'package:covidtrackerph/dashboard.dart';
import 'package:covidtrackerph/dashboardata/globalcases.dart';
import 'package:flutter/material.dart';
import 'package:covidtrackerph/dashboardata/dashboardservices.dart'
    as dashboardservices;
import 'package:covidtrackerph/dashboardata/phcases.dart';
import 'dashboardata/phcases.dart';

  
  final subTitleHeader = Text('stay at home pipz . keep safe',
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
    Future<PHCases> futurePHCases;
    Future<GlobalCases> futureGlobalCases;
  String confirmedCasesCount,recoveredCasesCount,deathCasesCount;
  String globalConfirmedCasesCount,globalRecoveredCasesCount,globalDeathCasesCount;

  @override
  void initState() {

    super.initState();
    futurePHCases = dashboardservices.getPHCases();
    futurePHCases.then((u) {
      setState(() {
          confirmedCasesCount = u.cases;
          recoveredCasesCount = u.recovered;
          deathCasesCount = u.deaths;
      });
    });

    futureGlobalCases = dashboardservices.getGlobalCases();
    futureGlobalCases.then((g){
        setState(() {
          globalConfirmedCasesCount = g.cases;
          globalRecoveredCasesCount = g.recovered;
          globalDeathCasesCount = g.deaths;
        });
    });

    Future.delayed(Duration(
      seconds: 3
      ),(){


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  DashBoard(
        confirmedCasesCount: confirmedCasesCount,
        recoveredCasesCount: recoveredCasesCount,
        deathCasesCount: deathCasesCount,
        globalConfirmedCasesCount: globalConfirmedCasesCount,
        globalRecoveredCasesCount: globalRecoveredCasesCount,
        globalDeathCasesCount: globalDeathCasesCount,
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
                child: Text("CORONA VIRUS TRACKER",style: TextStyle(fontSize: 20),)
              ),
        
            SizedBox(height: 10.0,),
            Center(
              child: subTitleHeader
            ),
          ],
        ),
    );
  }
}