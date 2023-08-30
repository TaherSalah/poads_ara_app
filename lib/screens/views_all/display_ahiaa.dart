import 'package:flutter/material.dart';

import '../../componts/widgets/divider.dart';
import '../../componts/widgets/titles.dart';
import '../home/home_screen.dart';

class AhiaaScreen extends StatefulWidget {
  const AhiaaScreen({Key? key}) : super(key: key);

  @override
  State<AhiaaScreen> createState() => _AhiaaScreenState();
}

class _AhiaaScreenState extends State<AhiaaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            myDivider(),
            CategInsideTitles(
              title: 'الأحياء',
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  )),
            ),
            myDivider(),
            const ItemsBuilder(),
          ],
        ),
      ),
    );
  }
}
