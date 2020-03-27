class GlobalCases{

  final String cases;
  final String deaths;
  final String recovered;
  final String activeCases;

  GlobalCases({this.cases, this.deaths, this.recovered, this.activeCases});
        factory GlobalCases.fromJson(Map<String, dynamic> json){
        return GlobalCases(
         cases: json["cases"].toString(),
         recovered: json["recovered"].toString(),
         deaths: json["deaths"].toString(),
         activeCases: json["active"].toString(),
        );
    }

}