import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/home_screen.dart';
import 'package:flutterapp/loginscreen.dart';
import 'package:flutterapp/signup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]
  );

  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
      initialRoute: '/',
      routes:{
        '/loginScreen' : (context) => LoginScreen(),
        '/signup' : (context) => SignUp()
      },
     );
  }
}



