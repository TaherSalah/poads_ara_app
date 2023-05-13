import 'package:flutter/material.dart';
import 'package:poads_app/componts/widgets/navigator.dart';

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
      appBar: AppBar(
        title: Text('الأحيـــاء'),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            myDivider(),
            CategTitles(title: 'الأحيـــاء'),
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
