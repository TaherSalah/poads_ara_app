import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poads_app/layout/cubit/cubit.dart';
import 'package:poads_app/screens/home/home_screen.dart';
import 'package:poads_app/screens/login/login_screen.dart';
import 'layout/cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final user = FirebaseAuth.instance.currentUser;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((context) => PoadcastCubit()),
        child: BlocConsumer<PoadcastCubit, PodcastStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Pods App',
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
              ),
              home: user == null ? LoginScreen() : HomeScreen(),
            );
          },
        ));
  }
}
