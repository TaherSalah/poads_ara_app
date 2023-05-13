import 'package:flutter/material.dart';

import '../../componts/widgets/divider.dart';
import '../../componts/widgets/titles.dart';
import '../home/home_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التاريخ'),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            myDivider(),
            CategTitles(title: 'التاريخ'),
            myDivider(),
            const ItemsBuilder(),


          ],
        ),
      ),
    );
  }
}
