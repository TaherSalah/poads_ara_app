// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../layout/cubit/cubit.dart';
// import '../../layout/cubit/states.dart';
//
// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  BlocConsumer<PoadcastCubit,PodcastStates>(
//
//
//         listener: (context,states){},
//         builder: (context,states){
//           return Center(child: Text('SettingsScreen'));
//         });
//
//   }
// }

import 'package:flutter/material.dart';
import 'package:poads_app/componts/widgets/navigator.dart';
import 'package:poads_app/screens/views_all/display_ahiaa.dart';
import 'package:poads_app/screens/views_all/display_economie.dart';
import 'package:poads_app/screens/views_all/display_phalcafa.dart';
import '../views_all/display_arabic.dart';
import '../views_all/display_goghraphic.dart';
import '../views_all/display_history.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<itemsModel> itemsList = [
    itemsModel(title: 'اللغة العربية'),
    itemsModel(title: 'التاريخ'),
    itemsModel(title: 'الجغرافيا'),
    itemsModel(title: 'الاحياء'),
    itemsModel(title: 'الفلسفة'),
    itemsModel(title: 'الاقتصاد'),
  ];
  List<Color> colors = [
    const Color(0xffF9F5EB),
    const Color(0xffF9F5EB),
    const Color(0xffF9F5EB),
    const Color(0xffF9F5EB),
    const Color(0xffF9F5EB),
    const Color(0xffF9F5EB),
  ];
  List<Widget> views = [
    const ArabicScreen(),
    const HistoryScreen(),
    const GeoghaphicScreen(),
    const AhiaaScreen(),
    const FalsaScreen(),
    const EconomieScreen()
  ];
  itemsModel? items;



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {

          return Column(
            children: [
              InkWell(
                  onTap: () {
                    navigateTo(context, views[index]);
                  },
                  child: Container(
                    color: Color(colors[index].value),
                    width: double.infinity,
                    height: 175,
                    child: Center(
                      child: Text(
                        itemsList[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontFamily: 'cairo', fontSize: 25),
                      ),
                    ),
                  )),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
        itemCount: itemsList.length);
  }
}

// ignore: camel_case_types
class itemsModel {
  // final String image;
  final String title;

  itemsModel({required this.title});
}
