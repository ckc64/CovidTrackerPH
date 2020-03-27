import 'package:covidtrackerph/dashboardata/globalcases.dart';
import 'package:covidtrackerph/dashboardata/phcases.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//https://corona.lmao.ninja/countries/Philippines
//https://corona.lmao.ninja/all


    String url = "https://corona.lmao.ninja/countries/Philippines";
     String urlGlobal = "https://corona.lmao.ninja/all";

    Future<PHCases> getPHCases() async{
      
      final response = await http.get(url);
         try {
              if (response.statusCode == 200) {
              // If the server did return a 200 OK response,
              // then parse the JSON.
              return PHCases.fromJson(json.decode(response.body));
            } else {
              // If the server did not return a 200 OK response,
              // then throw an exception.
              throw Exception('Failed to load Cases');
            }
    } catch (e) {
      throw Exception(e.toString());
  }
}


  

    Future<GlobalCases> getGlobalCases() async{
      
      final response = await http.get(urlGlobal);
         try {
              if (response.statusCode == 200) {
              // If the server did return a 200 OK response,
              // then parse the JSON.
              return GlobalCases.fromJson(json.decode(response.body));
            } else {
              // If the server did not return a 200 OK response,
              // then throw an exception.
              throw Exception('Failed to load Cases');
            }
    } catch (e) {
      throw Exception(e.toString());
  }
}