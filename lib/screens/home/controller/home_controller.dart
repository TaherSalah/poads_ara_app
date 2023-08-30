
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:poads_app/screens/home/home_screen.dart';
import 'package:poads_app/screens/login/login_screen.dart';


class HomeController extends ControllerMVC
{
  factory HomeController() {
    _this ??= HomeController._();
    return _this!;
  }
  bool isLoading=false;

  static HomeController? _this;
  HomeController._();

logout(BuildContext context)async{
  setState(() {
    isLoading = true;
  });
  await FirebaseAuth.instance.signOut();
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ));
  setState(() {
    isLoading = false;
  });

}



}