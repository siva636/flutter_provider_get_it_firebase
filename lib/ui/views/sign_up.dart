import 'package:flutter/material.dart';
import 'package:provider_get_it/enums/view_state.dart';
import 'package:provider_get_it/ui/widgets/custom_app_bar.dart';
import 'package:provider_get_it/view_models/global_view_model.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize:
            Size.fromHeight(context.read<GlobalViewModel>().appBarHeight),
      ),
      body: Center(
        child: Text('Sign Up', style: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}
