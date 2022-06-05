import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/layout/home_screen.dart';
import 'package:flutterapp/layout/loginscreen.dart';
import 'package:flutterapp/layout/PhoneNumber/number_screen.dart';
import 'package:flutterapp/layout/signup.dart';
import 'package:flutterapp/shared/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]
  );
  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoginScreen(),
      initialRoute: '/',
      routes:{
        '/loginScreen' : (context) => LoginScreen(),
        '/signup' : (context) => SignUp(),
        '/NumberScreen' : (context) => NumberScreen(),
        '/HomeScreen' : (context) => HomeScreen(),
      },
    );
  }
}



