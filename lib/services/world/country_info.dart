import 'package:provider_get_it/services/world/country_data.dart';

class CountryInfo {
  String getCountryName(String countryCode) {
    final elementData = countryData.firstWhere(
        (element) => element['ISO3166-1-Alpha-2'] == countryCode.toUpperCase(),
        orElse: () => {'name': 'Country Not Found'});
    return elementData['name'] ?? 'Country Not Found';
  }

  String getDialingCode(String countryCode) {
    final elementData = countryData.firstWhere(
        (element) => element['ISO3166-1-Alpha-2'] == countryCode.toUpperCase(),
        orElse: () => {'Dial': '??'});
    return elementData['Dial'] ?? '??';
  }
}
