
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  bool isActive = true;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(
            //     child: Image.asset(height: 150, 'assets/images/login.png')),
            const Text(
              'Register Now',
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (data) {
                  email = data;
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
                obscureText: widget.isActive,
                onChanged: (data) {
                  password = data;
                },
                validator: (value) {
                  if (value!.trim().length < 8) {
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
                    Navigator.pushNamed(context, 'Login');
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
                    textStyle: MaterialStatePropertyAll(
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 40))),
                onPressed: () async {},
                child: const Text('Register'))
          ],
        ),
      ),
    );
  }

  void togglePassword() {
    widget.isActive = !widget.isActive;
    setState(() {});
  }
}
