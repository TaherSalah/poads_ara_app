import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:poads_app/componts/widgets/validate.dart';
import 'package:poads_app/screens/home/home_screen.dart';
import 'package:poads_app/screens/login/login_screen.dart';
import 'package:poads_app/screens/registration/controller/register_controller.dart';
import 'package:poads_app/widgets/loading_screen.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  bool isActive = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends StateMVC<RegisterScreen> {
  _RegisterScreenState() : super(RegisterController()) {
    con = RegisterController();
  }

  late RegisterController con;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.isLoading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Center(
                    child:
                        Image.asset(height: 150, 'assets/images/micLogo.png')),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'Register Now',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: widget.userNameController,
                    onChanged: (data) {},
                    validator: Validator.name,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Enter Your Name',
                        label: Text('User Name'),
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
                    controller: widget.emailController,
                    onChanged: (data) {
                      // emailController.text = data;
                    },
                    validator: (value) {
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
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
                    controller: widget.passwordController,
                    obscureText: widget.isActive,
                    onChanged: (data) {
                      // passwordController.text = data;
                    },
                    validator: (value) {
                      if (value!.trim().length < 2) {
                        return 'Password must be at least 8 characters in length';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: togglePassword,
                          child: widget.isActive
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
                    const Text('Are You Have Account ? '),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: const Text(
                        'Login Now',
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.deepPurple),
                        elevation: MaterialStatePropertyAll(10),
                        textStyle: MaterialStatePropertyAll(TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20))),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await con.register(context,
                            email: widget.emailController.text,
                            password: widget.passwordController.text);
                      }
                    },
                    child: const Text('Register')),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void togglePassword() {
    widget.isActive = !widget.isActive;
    setState(() {});
  }
}
