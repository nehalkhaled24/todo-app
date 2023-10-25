
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/auth/login/loginScreen.dart';
import 'package:todo_app/auth/register/register_screen.dart';
import 'package:todo_app/home/home_screen.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/providers/list_provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseFirestore.instance.disableNetwork();

  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(ChangeNotifierProvider(
      create: (context) => ListProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:RegisterScreen.routeName ,
      routes: {HomeScreen.routeName:(context) => HomeScreen(),
        RegisterScreen.routeName:(context) => RegisterScreen(),
        LoginScreen.routeName:(context) => LoginScreen()

      },
      theme:MyTheme.lightTheme,
    );
  }
}



