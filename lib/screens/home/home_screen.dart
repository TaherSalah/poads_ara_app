import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:poads_app/screens/home/controller/home_controller.dart';
import 'package:poads_app/screens/login/login_screen.dart';
import 'package:poads_app/widgets/loading_screen.dart';

import '../../componts/widgets/divider.dart';
import '../../componts/widgets/navigator.dart';
import '../../componts/widgets/poads_builder.dart';
import '../../componts/widgets/titles.dart';
import '../../models/arabic_contant_model.dart';
import '../views_all/display_arabic.dart';
import '../views_all/display_goghraphic.dart';
import '../views_all/display_history.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
  ArabicModel? arabicModel;
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  _HomeScreenState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: LoadingScreen(
        loading: con.isLoading,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Poads Arab'),
            actions: [
              InkWell(
                onTap: () async {
                  await con.logout(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.logout),
                ),
              )
            ],
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              myDivider(),
              CategTitles(
                  title: 'اللغة العربية',
                  subtitle: "عرض الكل",
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ArabicScreen(),
                        ));
                  }),
              myDivider(),
              const SizedBox(child: ItemsBuilder()),
              myDivider(),
              CategTitles(
                title: 'التاريخ',
                subtitle: "عرض الكل",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HistoryScreen(),
                      ));
                },
              ),
              const SizedBox(child: ItemsBuilder()),
              myDivider(),
              CategTitles(
                title: 'الجغرافيا',
                subtitle: "عرض الكل",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GeoghaphicScreen(),
                      ));
                },
              ),
              const ItemsBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemsBuilder extends StatelessWidget {
  const ItemsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PoadsItemsBuilder(
                audio: araContents[index].audio,
                title: araContents[index].title,
                subtitle: araContents[index].desc,
                index: '${index + 1}');
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: araContents.length),
    );
  }
}
