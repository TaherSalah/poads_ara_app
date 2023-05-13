// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:poads_app/layout/cubit/cubit.dart';
//
// import '../../layout/cubit/states.dart';
//
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  BlocConsumer<PoadcastCubit,PodcastStates>(
//
//
//      listener: (context,states){},
//      builder: (context,states){
//        return Center(child: Text('SettingsScreen'));
//     });
//   }
// }
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poads_app/componts/widgets/navigator.dart';

import '../edit_profile/edit_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            // User card
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/user2.png',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                const Text(
                  'طاهر صلاح',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cairo',
                  ),
                ),
                Text(
                  'tahersalah@gmail.com',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(20),
                      shadowColor: MaterialStatePropertyAll(Colors.white12),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(20))),
                  onPressed: () {
                    navigateTo(context, const EditScreen());
                  },
                  child: const Text(
                    'تعديل الملف الشخصي ',
                    style: TextStyle(fontFamily: 'cairo', fontSize: 15),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),

            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.pencil_outline,
                  iconStyle: IconStyle(),
                  title: 'المظهر',
                  subtitle: "تغيير المظهر الخاص بالبرنامج",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'الوضع الليلي',
                  subtitle: "الافتراضي",
                  trailing: Switch.adaptive(
                    value: isDark,
                    onChanged: (value) {
                      setState(() {
                        isDark = value;
                        // ignore: avoid_print
                        print(value);
                      });
                    },
                  ),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'من نحن ؟  ',
                  subtitle: "تعرف عنا اكتر",
                ),
              ],
            ),
            SettingsItem(
              onTap: () {},
              icons: CupertinoIcons.question_circle,
              iconStyle: IconStyle(),
              title: 'مساعدة',
              subtitle: "لتقديم مساعدة اكثر حول البرنامج",
            ),

            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "اعدادات الحساب",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.exit_to_app_rounded,
                  title: "تسجيل الخروج",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  iconStyle: IconStyle(
                      iconsColor: Colors.red, backgroundColor: Colors.white),
                  title: "حذف الحساب",
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
