import 'dart:math';

import 'package:covidtrackerph/dashboardata/timelinedata.dart';
import 'package:covidtrackerph/dashboardata/timelineservices.dart'
    as timelineservices;
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;

class Timeline extends StatefulWidget {
  final List dateDeathTimeline,
      dateRecoveredTimeLine,
      countRecoveredTimeline,
      countDeathTimeline;
  const Timeline(
      {Key key,
      this.dateDeathTimeline,
      this.dateRecoveredTimeLine,
      this.countRecoveredTimeline,
      this.countDeathTimeline})
      : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<charts.Series<RecoveredTimelineCases, int>> _seriesLineData;

  _generateData() {
    List<RecoveredTimelineCases> recoveredData = [];
    List<RecoveredTimelineCases> deathData = [];
    for (int i = 0; i < widget.countRecoveredTimeline.length; i++) {
      recoveredData
          .add(RecoveredTimelineCases(i, widget.countRecoveredTimeline[i]));
    }
    for (int i = 0; i < widget.countDeathTimeline.length; i++) {
      deathData.add(RecoveredTimelineCases(i, widget.countDeathTimeline[i]));
    }
    // var linesalesdata2 = [
    //   new Sales(0,0),

    // ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff00994f)),
        id: 'Recovered',
        data: recoveredData,
        domainFn: (RecoveredTimelineCases rec, _) => (rec.date / 2).round(),
        measureFn: (RecoveredTimelineCases rec, _) => rec.recoveredCount,
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990000)),
        id: 'Death',
        data: deathData,
        domainFn: (RecoveredTimelineCases rec, _) => (rec.date / 2).round(),
        measureFn: (RecoveredTimelineCases rec, _) => rec.recoveredCount,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _seriesLineData = List<charts.Series<RecoveredTimelineCases, int>>();
    _generateData();
  }

  static String pointValue, numDays;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          "TIMELINE",
          style: TextStyle(fontFamily: 'Montserrat-Bold'),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => TimelineData())),
            icon: Icon(Icons.info_outline),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Cases update for the last ${widget.countDeathTimeline.length} days',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Montserrat-Regular',
                        color: Colors.white)),
                Text('starting Jan. 21,2020 to today',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Montserrat-Regular',
                        color: Colors.white)),
                Text('note* sometimes the update of this trend is delayed',
                    style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Montserrat-Regular',
                        color: Colors.red)),
                Expanded(
                  child: charts.LineChart(
                    _seriesLineData,
                    defaultRenderer: new charts.LineRendererConfig(),
                    animate: true,
                    animationDuration: Duration(seconds: 1),
                    behaviors: [
                      charts.LinePointHighlighter(

                          //symbolRenderer: CustomCircleSymbolRenderer()
                          ),
                      new charts.ChartTitle('No. of Days',
                          behaviorPosition: charts.BehaviorPosition.bottom,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                      new charts.ChartTitle('CASES COUNTS',
                          behaviorPosition: charts.BehaviorPosition.start,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                    ],
                    selectionModels: [
                      charts.SelectionModelConfig(
                          changedListener: (charts.SelectionModel model) {
                        if (model.hasDatumSelection) {
                          pointValue = model.selectedSeries[0]
                              .measureFn(model.selectedDatum[0].index)
                              .toString();
                          //pointValue = "1";

                        }
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecoveredTimelineCases {
  final int date;
  final double recoveredCount;

  RecoveredTimelineCases(this.date, this.recoveredCount);
}

// class CustomCircleSymbolRenderer extends charts.CircleSymbolRenderer{

//   @override
//   void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
//     // TODO: implement paint
//     super.paint(canvas, bounds, dashPattern:dashPattern, fillColor:fillColor, fillPattern:fillPattern, strokeColor:strokeColor, strokeWidthPx:strokeWidthPx);
//       canvas.drawRect(
//       Rectangle(bounds.left-5, bounds.top - 30, bounds.width + 45, bounds.height + 15),
//       fill: charts.Color(r: 255,g: 23,b: 68),

//     );
//     var textStyle = style.TextStyle();
//     textStyle.color = charts.Color(r:255,g:255,b:255);
//     textStyle.fontFamily = 'Montserrat-Regular';
//     textStyle.fontSize = 15;
//     canvas.drawText(

//       TextElement(_TimelineState.pointValue, style: textStyle),
//         (bounds.left).round(),
//         (bounds.top - 25).round()
//     );

//   }
// }
// class RecoveredTimelineCases {
//   int yearval;
//   int salesval;

//   RecoveredTimelineCases(this.yearval, this.salesval);
// }
