import 'package:flutter/material.dart';

import '../../componts/widgets/divider.dart';
import '../../componts/widgets/titles.dart';
import '../home/home_screen.dart';

class EconomieScreen extends StatefulWidget {
  const EconomieScreen({Key? key}) : super(key: key);

  @override
  State<EconomieScreen> createState() => _EconomieScreenState();
}

class _EconomieScreenState extends State<EconomieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            myDivider(),
            CategInsideTitles(
              title: 'الاقتصــاد',
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  )),
            ),
            myDivider(),
            const ItemsBuilder(),
            const ItemsBuilder(),
            const ItemsBuilder(),
          ],
        ),
      ),
    );
  }
}
