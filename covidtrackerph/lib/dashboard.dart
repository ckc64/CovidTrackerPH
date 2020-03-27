
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

class DashBoard extends StatefulWidget {
  final confirmedCasesCount;
  final recoveredCasesCount;
  final deathCasesCount;
  
  final globalConfirmedCasesCount;
  final globalRecoveredCasesCount;
  final globalDeathCasesCount;

  const DashBoard({Key key, this.confirmedCasesCount, this.recoveredCasesCount, this.deathCasesCount, this.globalConfirmedCasesCount, this.globalRecoveredCasesCount, this.globalDeathCasesCount}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with TickerProviderStateMixin {

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
        CurvedAnimation(parent: animationGlobalController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    animationGlobalController.forward();
  }

   _countGlobalRecoveredController(int begin, int end) {
    animationGlobalController1 =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animationGlobalRecoveredCase = IntTween(begin: begin, end: end).animate(
        CurvedAnimation(parent: animationGlobalController1, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    animationGlobalController1.forward();
  }
     _countGlobalDeathController(int begin, int end) {
    animationGlobalController2 =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animationGlobalDeathCase = IntTween(begin: begin, end: end).animate(
        CurvedAnimation(parent: animationGlobalController2, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    animationGlobalController2.forward();
  }
//END OF GLOBAL ANIMATION CONTROLLER
  
  @override
  void initState() {
    super.initState();
      //for ph
      _countCasesController(0, int.parse(widget.confirmedCasesCount));
      _countRecoveredController(0, int.parse(widget.recoveredCasesCount));
      _countDeathController(0, int.parse(widget.deathCasesCount));
      //for global

      _countGlobalCasesController(0, int.parse(widget.globalConfirmedCasesCount));
      _countGlobalRecoveredController(0, int.parse(widget.globalRecoveredCasesCount));
      _countGlobalDeathController(0, int.parse(widget.globalDeathCasesCount));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          "COVID-19 DASHBOARD",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
                  child:Text("COVID-19 Cases: PH, as of "
                    + DateFormat.yMMMMd("en_US").add_jm().format(new DateTime.now().toLocal()),
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular'
                  ),
                  )
                ),
            ),
          myItems(
              txtTitle: "CONFIRMED CASES",
              txtTitleFontSize: 25,
              colorTitle: Colors.white,
              colorsCount: Colors.deepOrange,
              countsPH: animationCountCase.value.toString(),
              countsGlobal: animationGlobalCountCase.value.toString()),
     
          myItems(
              txtTitle: "RECOVERED",
              txtTitleFontSize: 18,
              colorTitle: Colors.white,
              colorsCount: Colors.green,
              countsPH: animationCountRecovered.value.toString(),
              countsGlobal: animationGlobalRecoveredCase.value.toString()),

          myItems(
              txtTitle: "DEATHS",
              txtTitleFontSize: 18,
              colorTitle: Colors.white,
              colorsCount: Colors.red,
              countsPH: animationCountDeath.value.toString(),
              countsGlobal: animationGlobalDeathCase.value.toString()),
           myItemsOtherInfo(
             txtTitle: "OTHER INFORMATIONS",
              txtTitleFontSize: 18,
              colorTitle: Colors.white,
              colorsCount: Colors.red,
              countsPH: animationCountDeath.value.toString(),
              countsGlobal: animationGlobalDeathCase.value.toString()
          ),
     
          // myItems(Icons.people,"Trends","12412","124124",Colors.green),
          // myItems(Icons.people,"Trends","12412","1241241",Colors.green)
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 25),

          StaggeredTile.extent(2, 150),
       
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(1, 150),

          StaggeredTile.extent(2, 150),
          // StaggeredTile.extent(2, 250),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepOrange,
        child: Text(
          "+",
          style: TextStyle(fontSize: 30, color: Color(0xFF121212)),
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
                    fontFamily: 'Montserrat-Bold'
                  ),
              )
            ],
          ),
        ));
  }
}

 Material myItemsOtherInfo({
    String txtTitle,
    double txtTitleFontSize,
    Color colorTitle,
    Color colorsCount,
    String countsPH,
    String countsGlobal,
  }) {
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
              SizedBox(height: 5,),
              Text(
                "ACTIVE CASES : 55",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Montserrat-Regular',
                ),
              ),
               Text(
                "TODAYS CASES : 55",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Montserrat-Regular',
                ),
              ),
                Text(
                "CRITICAL : 55",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Montserrat-Regular',
                ),
              ),
               Text(
                "TODAYS DEATH : 55",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Montserrat-Regular',
                ),
              ),
                 Text(
                "CASE PER ONE MILLION : 55",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Montserrat-Regular',
                ),
              ),
                 Text(
                "DEATHS PER ONE MILLION : 55",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Montserrat-Regular',
                ),
              ),
                  Text(
                "GLOBAL ACTIVE CASES : 55",
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

