import 'package:provider_get_it/models/country.dart';
import 'package:provider_get_it/services/world/country_data.dart';

class CountryInfo {
  CountryInfo() {
    this.countryMap = {};

    this.countryList = countryData.map((e) {
      final countryCode = e['ISO3166-1-Alpha-2']!;
      final country = Country(
        countryName: e['name']!,
        countryCode: countryCode,
        dialingCode: e['Dial']!,
      );

      this.countryMap.addAll({countryCode: country});
      return country;
    }).toList();
  }

  late final List<Country> countryList;
  late final Map<String, Country> countryMap;

  Country? getCountry(String countryCode) {
    // assert(countryCode == countryCode.toUpperCase(),
    //     'countryCode must be uppercase');
    return countryMap[countryCode.toUpperCase()];
  }

  List<Country> getCountryOptions(String startsWith) {
    return countryList
        .where((element) => element.countryName
            .toLowerCase()
            .startsWith(startsWith.toLowerCase()))
        .toList();
  }

  // String getCountryName(String countryCode) {
  //   final elementData = countryData.firstWhere(
  //       (element) => element['ISO3166-1-Alpha-2'] == countryCode.toUpperCase(),
  //       orElse: () => {'name': 'Country Not Found'});
  //   return elementData['name'] ?? 'Country Not Found';
  // }

  // String getDialingCode(String countryCode) {
  //   final elementData = countryData.firstWhere(
  //       (element) => element['ISO3166-1-Alpha-2'] == countryCode.toUpperCase(),
  //       orElse: () => {'Dial': '??'});
  //   return elementData['Dial'] ?? '??';
  // }
}
