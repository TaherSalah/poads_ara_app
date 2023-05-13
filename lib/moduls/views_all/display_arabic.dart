import 'package:flutter/material.dart';
import '../../componts/widgets/divider.dart';
import '../../componts/widgets/titles.dart';
import '../home/home_screen.dart';


class ArabicScreen extends StatefulWidget {
  const ArabicScreen({Key? key}) : super(key: key);

  @override
  State<ArabicScreen> createState() => _ArabicScreenState();
}

class _ArabicScreenState extends State<ArabicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اللغة العربية'),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            myDivider(),
            CategTitles(title: 'اللغة العربية'),
            myDivider(),
            const ItemsBuilder(),


          ],
        ),
      ),
    );
  }
}
