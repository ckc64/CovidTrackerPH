class Country{

  final String countryName;
  final CountryInfo countryInfo;
  final String allCases;
  final String deathCase;
  final String recoveredCase;

  Country({this.countryInfo, this.countryName, this.allCases, this.deathCase, this.recoveredCase});
//https://corona.lmao.ninja/countries
    factory Country.fromJson(Map<String, dynamic> json){
      return Country(
        countryName: json['country'],
        countryInfo: CountryInfo.fromJson(json['countryInfo']),
        allCases:json['cases'].toString(),
        deathCase: json['deaths'].toString(),
        recoveredCase: json['recovered'].toString()
      );
    }
}

class CountryInfo{
  final String flag;
  final String iso;

  CountryInfo({this.flag, this.iso});

  factory CountryInfo.fromJson(Map<String, dynamic> json){
    return CountryInfo(
      flag: json['flag'],
      iso:json['iso3']
    );
  }

}
