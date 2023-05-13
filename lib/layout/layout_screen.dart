import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:poads_app/componts/style/colors.dart';
import 'package:poads_app/componts/widgets/navigator.dart';
import 'package:poads_app/layout/cubit/cubit.dart';
import '../moduls/search/search_screen.dart';
import 'cubit/states.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PoadcastCubit,PodcastStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit= PoadcastCubit.get(context) ;
        return Scaffold(
          appBar: AppBar(
            title: const Directionality(
              textDirection: TextDirection.rtl,
              child: Text('بــودكاست بالعربي '),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, const SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.dark_mode),
              )
            ],
          ),
          body: cubit.screenBottom[cubit.currentIndex],
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.rtl,
            child: defualtBottomNavigationBar(
                context: context,
                tabs: [
                  const GButton(
                    icon: Icons.home,
                    text: 'الرئيسيه',
                  ),
                  const GButton(
                    icon: Icons.category,
                    text: 'الموضوعات',
                  ),
                  const GButton(
                    icon: Icons.settings,
                    text: 'الاعدادات',
                  ),
                ],
                onTabChange: (int index) {
                  cubit.changeBottom(index);
                },
                currentIndex:
                cubit.currentIndex,
                ),
          ),
        );
      },
    );
  }
}

Widget defualtBottomNavigationBar({
  required List<GButton> tabs,
  required ValueChanged<int> onTabChange,
  required int currentIndex,
  required BuildContext context,
}) =>
    Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
      child: GNav(
        gap: 7,
        onTabChange: onTabChange,
        selectedIndex: 0,
        curve: Curves.bounceInOut,
        activeColor: scondaryColor,
        hoverColor: Colors.lime,
        color: Colors.grey,
        textStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
        tabBackgroundColor: Colors.black45,
        padding: const EdgeInsets.all(16),
        tabs: tabs,
      ),
    ));
