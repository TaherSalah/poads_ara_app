import 'package:flutter/material.dart';

import '../../componts/widgets/divider.dart';
import '../../componts/widgets/navigator.dart';
import '../../componts/widgets/poads_builder.dart';
import '../../componts/widgets/titles.dart';
import '../../models/arabic_contant_model.dart';
import '../views_all/display_arabic.dart';
import '../views_all/display_goghraphic.dart';
import '../views_all/display_history.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  ArabicModel? arabicModel;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        children: [
          myDivider(),
           CategTitles(title: 'اللغة العربية', subtitle: "عرض الكل",onPressed: (){navigateTo(context, ArabicScreen());}),
          myDivider(),
          ItemsBuilder(),
          myDivider(),
           CategTitles(title: 'التاريخ', subtitle: "عرض الكل",onPressed: (){
             navigateTo(context, const HistoryScreen());
           },),
          ItemsBuilder(),
          myDivider(),
           CategTitles(title: 'الجغرافيا', subtitle: "عرض الكل",onPressed: (){
             navigateTo(context, const GeoghaphicScreen());
           },),
          ItemsBuilder(),

        ],
      ),
    );
  }
}

class ItemsBuilder extends StatelessWidget {
  const ItemsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PoadsItemsBuilder(
              title: araContents[index].title,
              subtitle: araContents[index].desc,
              index: '${index + 1}'
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: araContents.length);
    ;
  }
}
