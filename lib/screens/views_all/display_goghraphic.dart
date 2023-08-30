import 'package:flutter/material.dart';

import '../../componts/widgets/divider.dart';
import '../../componts/widgets/titles.dart';
import '../home/home_screen.dart';

class GeoghaphicScreen extends StatefulWidget {
  const GeoghaphicScreen({Key? key}) : super(key: key);

  @override
  State<GeoghaphicScreen> createState() => _GeoghaphicScreenState();
}

class _GeoghaphicScreenState extends State<GeoghaphicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            myDivider(),
            CategInsideTitles(
              title: 'الجغرافيا',
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
