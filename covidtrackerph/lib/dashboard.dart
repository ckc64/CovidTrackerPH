import 'package:covidtrackerph/dashboardata/classfiles/confirmedcases.dart';
import 'package:covidtrackerph/dashboardata/faq/faq.dart';
import 'package:covidtrackerph/dashboardata/timeline.dart';
import 'package:covidtrackerph/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



//Global variable cause Im TIRED of OOP //refactor later
 List<String> deathDateListTimeline;
 List<String> recoveredDateListTimeline;


class DashBoard extends StatefulWidget {
  final List<double>caseNum;
  final List<double>caseNumRecovered;
   
  final confirmedCasesCount;
  final recoveredCasesCount;
  final deathCasesCount;
  final activeCasesCount,
      todaysCasesCount,
      critcalCount,
      todaysDeathCount,
      casePerOneMillion,
      deathsPerOneMillion;

  final globalConfirmedCasesCount;
  final globalRecoveredCasesCount;
  final globalDeathCasesCount;
  final globalActiveCasesCount;

  const DashBoard(
      {Key key,
     
      this.caseNumRecovered,
      this.caseNum,
      this.confirmedCasesCount,
      this.recoveredCasesCount,
      this.deathCasesCount,
      this.globalConfirmedCasesCount,
      this.globalRecoveredCasesCount,
      this.globalDeathCasesCount,
      this.activeCasesCount,
      this.todaysCasesCount,
      this.critcalCount,
      this.todaysDeathCount,
      this.casePerOneMillion,
      this.deathsPerOneMillion,
      this.globalActiveCasesCount})
      : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {

   

// PH ANIMATION CONTROLLER
  Animation<int> animationCountCase;
  Animation<int> animationCountRecovered;
  Animation<int> animationCountDeath;

  AnimationController animationController;
  AnimationController animationController1;
  AnimationController animationController2;

  _countCasesController(int begin, int end) {
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animationCountCase = IntTween(begin: begin, end: end).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  _countRecoveredController(int begin, int end) {
    animationController1 =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animationCountRecovered = IntTween(begin: begin, end: end).animate(
        CurvedAnimation(parent: animationController1, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    animationController1.forward();
  }

  _countDeathController(int begin, int end) {
    animationController2 =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animationCountDeath = IntTween(begin: begin, end: end).animate(
        CurvedAnimation(parent: animationController2, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    animationController2.forward();
  }

//END OF PH ANIMATION CONTROLLER

//GLOBAL ANIMATION CONTROLLER
  Animation<int> animationGlobalCountCase;
  Animation<int> animationGlobalRecoveredCase;
  Animation<int> animationGlobalDeathCase;

  AnimationController animationGlobalController;
  AnimationController animationGlobalController1;
  AnimationController animationGlobalController2;

  _countGlobalCasesController(int begin, int end) {
    animationGlobalController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animationGlobalCountCase = IntTween(begin: begin, end: end).animate(
        CurvedAnimation(
            parent: animationGlobalController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    animationGlobalController.forward();
  }

  _countGlobalRecoveredController(int begin, int end) {
    animationGlobalController1 =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animationGlobalRecoveredCase = IntTween(begin: begin, end: end).animate(
        CurvedAnimation(
            parent: animationGlobalController1, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    animationGlobalController1.forward();
  }

  _countGlobalDeathController(int begin, int end) {
    animationGlobalController2 =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animationGlobalDeathCase = IntTween(begin: begin, end: end).animate(
        CurvedAnimation(
            parent: animationGlobalController2, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    animationGlobalController2.forward();
  }
//END OF GLOBAL ANIMATION CONTROLLER

  //Charts Data List


  Future<void> fetchDeathTimeLine() async{
  deathDateListTimeline=[];
  
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
       deathDateListTimeline.add(d);
     }

      
   }
  
}

     Future<void> fetchRecoveredCaseCountTimeLine() async{
recoveredDateListTimeline = [];
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
      
       recoveredDateListTimeline.add(d); 
     }
      
   }
    
    }


  @override
  void initState() {
    super.initState();
    //for ph
    _countCasesController(0, int.parse(widget.confirmedCasesCount));
    _countRecoveredController(0, int.parse(widget.recoveredCasesCount));
    _countDeathController(0, int.parse(widget.deathCasesCount));
    //for global

    _countGlobalCasesController(0, int.parse(widget.globalConfirmedCasesCount));
    _countGlobalRecoveredController(
        0, int.parse(widget.globalRecoveredCasesCount));
    _countGlobalDeathController(0, int.parse(widget.globalDeathCasesCount));

    //forchart
    fetchDeathTimeLine();
    fetchRecoveredCaseCountTimeLine();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          "COVID-19 DASHBOARD",
          style: TextStyle(fontFamily: 'Montserrat-Bold'),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.language),
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Global())),
          )
        ],
      ),
      body: StaggeredGridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          Center(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "COVID-19 Cases: PH, as of " +
                      DateFormat.yMMMMd("en_US")
                          .add_jm()
                          .format(new DateTime.now().toLocal()),
                  style: TextStyle(
                      fontFamily: 'Montserrat-Regular', color: Colors.white),
                )
              ),
          ),
          InkWell(
            splashColor: Colors.black,
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmedCases())),
                      child: myItems(
                txtTitle: "CONFIRMED CASES",
                txtTitleFontSize: 25,
                colorTitle: Colors.white,
                colorsCount: Colors.deepOrange,
                countsPH: animationCountCase.value.toString(),
                countsGlobal: animationGlobalCountCase.value.toString(),
                tapToview: "TAP TO VIEW DETAILS"

                ),

          ),
          myItems(
              txtTitle: "RECOVERED",
              txtTitleFontSize: 18,
              colorTitle: Colors.white,
              colorsCount: Colors.green,
              countsPH: animationCountRecovered.value.toString(),
              countsGlobal: animationGlobalRecoveredCase.value.toString(),
              tapToview: ""
            ),
          myItems(
              txtTitle: "DEATHS",
              txtTitleFontSize: 18,
              colorTitle: Colors.white,
              colorsCount: Colors.red,
              countsPH: animationCountDeath.value.toString(),
              countsGlobal: animationGlobalDeathCase.value.toString(),
              tapToview: ""
              
              ),
          InkWell(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Timeline(dateDeathTimeline: deathDateListTimeline,dateRecoveredTimeLine: recoveredDateListTimeline,countRecoveredTimeline:widget.caseNumRecovered,countDeathTimeline: widget.caseNum,))),
                      child: chartsInfo(
                txtTitle: "TRENDS",
                txtTitleFontSize: 18,
                colorTitle: Colors.white,
                dataDeath: widget.caseNum,
                dataRecovered: widget.caseNumRecovered,
                context: context
              ),
          ),
         
          myItemsOtherInfo(
              txtTitle: "OTHER INFORMATIONS",
              txtTitleFontSize: 18,
              colorTitle: Colors.white,
              activeCasesCount: widget.activeCasesCount,
              casePerOneMillion: widget.casePerOneMillion,
              critcalCount: widget.critcalCount,
              deathsPerOneMillion: widget.deathsPerOneMillion,
              globalActiveCase: widget.globalActiveCasesCount,
              todaysCasesCount: widget.todaysCasesCount,
              todaysDeathCount: widget.todaysDeathCount),

          Center(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Text(
                  "COVID-19 hotlines:" ,
                  style: TextStyle(
                      fontSize:14,fontFamily: 'Montserrat-Bold', color: Colors.white),
                ),
                    Text(
                  "1555(PLDT,Smart, Sun, and TnT)" ,
                  style: TextStyle(
                      fontSize:16,fontFamily: 'Montserrat-Bold', color: Colors.white),
                ),
                  Text(
                  "(02) 894-26843 (894-COVID)" ,
                  style: TextStyle(
                      fontSize:16,fontFamily: 'Montserrat-Bold', color: Colors.white),
                ),
                  ],
                )
                
                
                ),
          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 25),

          StaggeredTile.extent(2, 170),

          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(2, 250),
          StaggeredTile.extent(2, 170),
          StaggeredTile.extent(2, 80),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQ())),
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.info,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

//==== FOR STAGGERED GRID
  Material myItems({
    String txtTitle,
    double txtTitleFontSize,
    Color colorTitle,
    Color colorsCount,
    String countsPH,
    String countsGlobal,
    String tapToview
  }) {
    return Material(
        elevation: 3.0,
        color: Color(0xFF272727),
        borderRadius: BorderRadius.circular(3.0),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                txtTitle,
                style: TextStyle(
                  color: colorTitle,
                  fontSize: txtTitleFontSize,
                ),
              ),
              Text(
                countsPH,
                style: TextStyle(
                  color: colorsCount,
                  fontSize: 55,
                  fontFamily: 'Montserrat-Bold',
                ),
              ),
              Text(
                "GLOBAL",
                style: TextStyle(
                  color: colorTitle,
                  fontSize: 14,
                ),
              ),
              Text(
                countsGlobal,
                style: TextStyle(
                    color: colorsCount,
                    fontSize: 20,
                    fontFamily: 'Montserrat-Bold'),
              ),
                Text(
                tapToview,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontFamily: 'Montserrat-Regular'
                ),
              )
            ],
          ),
        ));
  }
}

Material myItemsOtherInfo(
    {String txtTitle,
    double txtTitleFontSize,
    Color colorTitle,
    String activeCasesCount,
    String todaysCasesCount,
    String critcalCount,
    String todaysDeathCount,
    String casePerOneMillion,
    String deathsPerOneMillion,
    String globalActiveCase}) {
  return Material(
      elevation: 3.0,
      color: Color(0xFF272727),
      borderRadius: BorderRadius.circular(3.0),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              txtTitle,
              style: TextStyle(
                color: colorTitle,
                fontSize: txtTitleFontSize,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "ACTIVE CASES : " + activeCasesCount,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'Montserrat-Regular',
              ),
            ),
            Text(
              "TODAYS CASES : " + todaysCasesCount,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'Montserrat-Regular',
              ),
            ),
            Text(
              "CRITICAL : " + critcalCount,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'Montserrat-Regular',
              ),
            ),
            Text(
              "TODAYS DEATH : " + todaysDeathCount,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'Montserrat-Regular',
              ),
            ),
            Text(
              "CASE PER ONE MILLION : " + casePerOneMillion,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'Montserrat-Regular',
              ),
            ),
            Text(
              "DEATHS PER ONE MILLION : " + deathsPerOneMillion,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'Montserrat-Regular',
              ),
            ),
            Text(
              "GLOBAL ACTIVE CASES : " + globalActiveCase,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'Montserrat-Regular',
              ),
            ),
          ],
        ),
      ));
}

Material chartsInfo(
    {String txtTitle,
    double txtTitleFontSize,
    Color colorTitle,
    List<double> dataRecovered,
    List<double> dataDeath,
    BuildContext context
    }) {
  return  Material(
        elevation: 3.0,
        color: Color(0xFF272727),
        borderRadius: BorderRadius.circular(3.0),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                txtTitle,
                style: TextStyle(
                  color: colorTitle,
                  fontSize: txtTitleFontSize,
                ),
              ),
               Text(
                "*note sometimes data is not available(possible reason updating)",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 5,
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                  "Recovered",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 14
                  ),
                 ),
                 SizedBox(width: 10,),
                  Container(
                
                    width: 30,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.green
                    ),
                  ),
                     SizedBox(width: 10,),
                  //DEATH

                       Text(
                  "Deaths",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 14
                  ),
                 ),
                 SizedBox(width: 10,),
                  Container(
                
                    width: 30,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.red
                    ),
                  )
               ],
             ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Stack(
                  children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Sparkline(
                          data: dataRecovered,
                          lineColor: Colors.green,
                          pointsMode: PointsMode.last,
                          pointSize: 8,
                          pointColor: Colors.green,
                     
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Sparkline(
                          data: dataDeath,
                          lineColor: Colors.red,
                          pointsMode: PointsMode.last,
                          pointSize: 8,
                          pointColor: Colors.red,
                          
                        ),
                      ),
                  ],
                ),
              ),
              Text(
                "TAP TO VIEW DETAILS",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontFamily: 'Montserrat-Regular'
                ),
              )
            ],
          ),
        ));
  
}
