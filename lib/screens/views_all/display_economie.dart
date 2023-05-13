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
      appBar: AppBar(
        title: const Text('الاقتصــاد'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            myDivider(),
            CategTitles(title: 'الاقتصــاد'),
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
