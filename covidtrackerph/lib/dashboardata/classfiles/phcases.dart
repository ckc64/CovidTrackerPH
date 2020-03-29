class PHCases{
  final String cases;
  final String todayCases;
  final String deaths;
  final String todaysDeath;
  final String recovered;
  final String active;
  final String critical;
  final String casePerOneMillion;
  final String deathsPerOneMillion;

    PHCases({this.cases, 
    this.todayCases, 
    this.deaths, 
    this.todaysDeath, 
    this.recovered,
    this.active, 
    this.critical, 
    this.casePerOneMillion, 
    this.deathsPerOneMillion
});

      factory PHCases.fromJson(Map<String, dynamic> json){
        return PHCases(
         cases: json["cases"].toString(),
         todayCases: json["todayCases"].toString(),
         deaths: json["deaths"].toString(),
         todaysDeath: json["todayDeaths"].toString(),
         recovered: json["recovered"].toString(),
         active: json["active"].toString(),
         critical: json["critical"].toString(),
         casePerOneMillion: json["casesPerOneMillion"].toString(),
         deathsPerOneMillion: json["deathsPerOneMillion"].toString()
        );
    }
}