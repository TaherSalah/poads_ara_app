import 'package:flutter/material.dart';
import 'package:poads_app/screens/registration/regstration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isActive = true;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(child: Image.asset(height: 150, 'assets/images/login.png')),
            const Text(
              'Login Now',
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onChanged: (data) {
                  email = data;
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
                  if (value!.trim().length < 8) {
                    return 'Password must be at least 8 characters in length';
                  }
                  return null;
                },
                controller: TextEditingController(),
                keyboardType: TextInputType.phone,
                onChanged: (data) {
                  password = data;
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
                const Text('Are You Have Account ? '),
                TextButton(
                  onPressed: () {
                    Navigator.push(
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
                        EdgeInsets.symmetric(horizontal: 20, vertical: 40))),
                onPressed: () async {},
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }

  void togglePassword() {
    isActive = !isActive;
    setState(() {});
  }
}
