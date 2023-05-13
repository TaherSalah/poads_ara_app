import 'package:flutter/material.dart';
import 'package:poads_app/componts/widgets/navigator.dart';

import '../../componts/widgets/divider.dart';
import '../../componts/widgets/titles.dart';
import '../home/home_screen.dart';

class FalsaScreen extends StatefulWidget {
  const FalsaScreen({Key? key}) : super(key: key);

  @override
  State<FalsaScreen> createState() => _FalsaScreenState();
}

class _FalsaScreenState extends State<FalsaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلسفة'),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            myDivider(),
            CategTitles(title: 'الفلسفة'),
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
