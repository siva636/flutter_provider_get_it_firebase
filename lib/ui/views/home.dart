import 'package:flutter/material.dart';
import 'package:provider_get_it/constants.dart';
import 'package:provider_get_it/services/adaptive_breakpoints.dart';
import 'package:provider_get_it/ui/widgets/country_name_with_flag.dart';
import 'package:provider_get_it/ui/widgets/custom_app_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double margin = getBreakpointsInfo(context).margin;
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize: Size.fromHeight(appBarHeight),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        child: Center(
          child: Text('Home', style: Theme.of(context).textTheme.headline3),
        ),
      ),
    );
  }
}
