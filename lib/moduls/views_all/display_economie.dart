import 'package:flutter/material.dart';
import 'package:poads_app/componts/widgets/navigator.dart';

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
        title: Text('الاقتصــاد'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            myDivider(),
            CategTitles(title: 'الاقتصــاد'),
            myDivider(),
            ItemsBuilder(),
            ItemsBuilder(),
            ItemsBuilder(),

          ],
        ),
      ),
    );
  }
}
