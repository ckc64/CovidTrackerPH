import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class TimelineData extends StatefulWidget {
  @override
  _TimelineDataState createState() => _TimelineDataState();
}



class _TimelineDataState extends State<TimelineData> {


    Future fetchDeathDateTimeLine() async{
   List<String> deathDateListTimeline=[];

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
  
    return deathDateListTimeline;
  
}

    Future fetchDeathCountTimeLine() async{
  List<String> deathDateListTimeline=[];

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
     
      deathDateListTimeline.add(data[d]);   
     }
       
    }
 
  return deathDateListTimeline;
}


   Future fetchRecoveredDateCaseCountTimeLine() async{
 List<String> recoveredDateListTimeline = [];
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
   return recoveredDateListTimeline;
    
    }

 Future fetchRecoveredCaseCountTimeLine() async{
 List<String> recoveredDateListTimeline = [];
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
      
       recoveredDateListTimeline.add(data[d]); 
     }
      
   }
   return recoveredDateListTimeline;
    
    }






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
              text: "RECOVERED",

            ),
            Tab(
              text: "DEATHS",
            )
          ],
        ),
        ),
        body:  TabBarView(
          children: [
     Container(
      child: FutureBuilder(
        future: fetchRecoveredDateCaseCountTimeLine(),
        builder: (context, snapshots1){
          if(!snapshots1.hasData){
            return CircularProgressIndicator();
          }
            return FutureBuilder(
                future: fetchRecoveredCaseCountTimeLine(),
                builder: (context, snapshots2){
                  if(!snapshots2.hasData){
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    itemCount: snapshots1.data.length,

                    physics: BouncingScrollPhysics(),
                    reverse: true,
                    itemBuilder: (context,index){
                      return ListTile(
                            title: Text(snapshots1.data[index],
                            style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Regular'
                      ),
                            ),
                            subtitle: Text("Total Recovered : "+snapshots2.data[index],
                                 style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Regular'
                      ),
                            ),
                      );
                    }
                  
                  );
                }
            );
        },
      ),
  ),
  //DEATH COUNTS
    Container(
      child: FutureBuilder(
        future: fetchDeathDateTimeLine(),
        builder: (context, snapshots1){
          if(!snapshots1.hasData){
            return CircularProgressIndicator();
          }
            return FutureBuilder(
                future: fetchDeathCountTimeLine(),
                builder: (context, snapshots2){
                  if(!snapshots2.hasData){
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    itemCount: snapshots1.data.length,
                    physics: BouncingScrollPhysics(),
                    reverse: true,
                    itemBuilder: (context,index){
                      return ListTile(
                            title: Text(snapshots1.data[index],
                            style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Regular'
                      ),
                            ),
                            subtitle: Text("Total Death : "+snapshots2.data[index],
                                 style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Regular'
                      ),
                            ),
                      );
                    }
                  
                  );
                }
            );
        },
      ),
  ),
           
          ],
        ),
        
     
      ),
    );
  }
}