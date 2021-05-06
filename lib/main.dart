import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'Login.dart';
import "UserPage.dart";
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init("Loggedin");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final loggedinuser = GetStorage("Loggedin");
  runApp(ProviderScope(
      child: GetMaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
      brightness: Brightness.light,
    ),
    themeMode: ThemeMode.light,
    darkTheme: ThemeData(
      primarySwatch: Colors.amber,
      accentColor: Colors.grey,
      brightness: Brightness.dark,
    ),
    initialRoute: loggedinuser.hasData("Email") ? '/userpage/' : '/loginpage/',
    getPages: [
      GetPage(
        name: '/userpage/',
        page: () => UserPage(),
      ),
      GetPage(
        name: '/loginpage/',
        page: () => LoginScreen(),
      ),
    ],
  )));
}
