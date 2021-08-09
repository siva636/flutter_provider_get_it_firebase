import 'package:flutter/material.dart';
import 'package:provider_get_it/services/world/country_info.dart';

class CountryNameWithFlag extends StatelessWidget {
  CountryNameWithFlag({Key? key, required this.countryCode}) : super(key: key);
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/flags/${countryCode.toLowerCase()}.png',
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.error_outline),
          height: 12,
        ),
        SizedBox(
          width: 4,
        ),
        Text(CountryInfo().getCountry(countryCode)?.countryName ??
            'Country Not Found'),
      ],
    );
  }
}
