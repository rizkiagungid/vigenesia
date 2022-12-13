// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'Screens/login.dart';
import 'Screens/main.dart';
import 'dart:async';
import 'splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email') ?? '';
  var nama = prefs.getString('nama') ?? '';
  var id = prefs.getString('id') ?? '';
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == ''
          ? const SplashScreenPage()
          : MainScreens(nama: nama, idUser: id),
    ),
    // splashScreen = SplashScreen(
    //   seconds: 5,
    //   navigateAfterSeconds: new AfterSplash(),
    //   title: new Text('Welcome In SplashScreen'),
    //   image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
    //   backgroundColor: Colors.white,
    //   styleTextUnderTheLoader: new TextStyle(),
    //   photoSize: 100.0,
    //   onClick: () => print("Flutter Egypt"),
    //   loaderColor: Colors.red
    // );
  );
}
