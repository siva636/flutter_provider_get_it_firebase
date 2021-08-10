import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider_get_it/services/get_it.dart';
import 'package:provider_get_it/ui/views/account.dart';
import 'package:provider_get_it/ui/views/help.dart';
import 'package:provider_get_it/ui/views/home.dart';
import 'package:provider_get_it/ui/views/search.dart';
import 'package:provider_get_it/ui/views/sign_up.dart';
import 'package:provider_get_it/view_models/global_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getItSetup();
  runApp(
    ChangeNotifierProvider(
      create: (context) => GlobalViewModel(),
      child: App(),
    ),
    // App(),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Error();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MainHome();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => Home(),
        '/help': (BuildContext context) => Help(),
        '/search': (BuildContext context) => Search(),
        '/account': (BuildContext context) => Account(),
        '/sign_up': (BuildContext context) => SignUp(),
      },
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('Error',
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: Colors.red)),
    );
  }
}
