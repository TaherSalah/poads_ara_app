import 'package:flutter/material.dart';

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
        title: const Text('الفلسفة'),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            myDivider(),
            CategTitles(title: 'الفلسفة'),
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
