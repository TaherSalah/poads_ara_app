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
      appBar: AppBar(
        title: const Text('الجغرافيا'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            myDivider(),
            CategTitles(title: 'الجغرافيا'),
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
