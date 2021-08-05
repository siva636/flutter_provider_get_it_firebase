import 'package:flutter/material.dart';
import 'package:provider_get_it/constants.dart';
import 'package:provider_get_it/ui/widgets/custom_app_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize: Size.fromHeight(appBarHeight),
      ),
      body: Center(
        child: Text('Home', style: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}
