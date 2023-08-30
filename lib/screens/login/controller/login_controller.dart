import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:poads_app/screens/home/home_screen.dart';

class LoginController extends ControllerMVC {
  factory LoginController() {
    _this ??= LoginController._();
    return _this!;
  }

  bool isLoading = false;

  static LoginController? _this;

  LoginController._();

  login(BuildContext context,
      {required String email, required String password}) async {
    try {
      setState(() {
        isLoading = true;
      });
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));

    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Auth Error"),
              content: const Text("No user found for that email"),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Okay"))
              ],
            );
          },
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Auth error"),
              content: const Text("Wrong password provided for that user."),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Okay"))
              ],
            );
          },
        );
        print('Wrong password provided for that user.');
      }
    }
  }

  signInAnonymously(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });
      final userCredential = await FirebaseAuth.instance.signInAnonymously();

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Dialog title"),
            content: const Text("Signed in with temporary account."),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Okay"))
            ],
          );
        },
      );
      print("Signed in with temporary account.");
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));

    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Dialog title"),
                content: const Text(
                    "Anonymous auth hasn't been enabled for this project."),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Okay"))
                ],
              );
            },
          );
          break;
        default:
          print("Unknown error.");
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Dialog title"),
                content: const Text("Unknown error."),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Okay"))
                ],
              );
            },
          );
      }
    }
  }
}
