
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:poads_app/screens/login/controller/login_controller.dart';
import 'package:poads_app/screens/registration/regstration_screen.dart';
import 'package:poads_app/widgets/loading_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  final userCredential = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  _LoginScreenState() : super(LoginController()) {
    con = LoginController();
  }

  bool isActive = true;
  late LoginController con;

  // String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                    child:
                        Image.asset(height: 150, 'assets/images/micLogo.png')),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Login Now',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: widget.emailController,
                    validator: (value) {
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onChanged: (data) {
                      // email = data;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Enter Your Email',
                        label: Text('Email'),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.trim().length < 4) {
                        return 'Password must be at least 8 characters in length';
                      }
                      return null;
                    },
                    controller: widget.passwordController,
                    keyboardType: TextInputType.phone,
                    onChanged: (data) {
                      // password = data;
                    },
                    obscureText: isActive,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: togglePassword,
                          child: isActive
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        prefixIcon: const Icon(Icons.lock_open_outlined),
                        hintText: 'Enter Your Password',
                        label: const Text('password'),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don/'t Have an Account ?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                      },
                      child: const Text(
                        'Register Now',
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepPurple),
                      elevation: MaterialStatePropertyAll(10),
                      textStyle: MaterialStatePropertyAll(
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20))),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await con.login(
                        context,
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await con.signInAnonymously(context);
                      },
                      child: Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/icons-person.png',
                              height: 50,
                              width: 50,
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void togglePassword() {
    isActive = !isActive;
    setState(() {});
  }
}

