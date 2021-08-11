import 'package:flutter_test/flutter_test.dart';
import 'package:provider_get_it/services/world/country_data.dart';

void main() {
  group('Country', () {
    test('name must not be null', () {
      countryData.forEach((element) {
        expect(element['name'], isNotNull);
      });
    });
    test('code must not be null', () {
      countryData.forEach((element) {
        expect(element['ISO3166-1-Alpha-2'], isNotNull);
      });
    });
    test('code must be of length 2', () {
      countryData.forEach((element) {
        expect(element['ISO3166-1-Alpha-2']?.length, 2);
      });
    });
    test('code must be in uppercase', () {
      countryData.forEach((element) {
        final countryCode = element['ISO3166-1-Alpha-2'];
        expect(countryCode == countryCode?.toUpperCase(), true);
      });
    });
    test('dialing code must be null', () {
      countryData.forEach((element) {
        expect(element['Dial'], isNotNull);
      });
    });
  });
}
