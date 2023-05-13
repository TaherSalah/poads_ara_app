import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poads_app/layout/cubit/cubit.dart';
import 'package:poads_app/moduls/on_boarding/on_boarding_screen.dart';
import 'package:poads_app/moduls/splash/splash_screen.dart';
import 'layout/cubit/states.dart';
import 'layout/layout_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

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
              title: 'Poads App',
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
              ),
              home: const SplashScreen(),
            );
          },
        ));
  }
}
