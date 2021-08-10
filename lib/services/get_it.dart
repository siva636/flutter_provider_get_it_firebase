import 'package:get_it/get_it.dart';
import 'package:provider_get_it/services/world/country_info.dart';

GetIt getIt = GetIt.instance;

void getItSetup() {
  getIt.registerLazySingleton<CountryInfo>(() => CountryInfo());
}
