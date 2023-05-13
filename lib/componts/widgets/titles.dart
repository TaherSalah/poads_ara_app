import 'package:flutter/material.dart';

import '../style/colors.dart';

class CategTitles extends StatelessWidget {
   CategTitles({Key? key, required this.title,this.subtitle,this.onPressed})
      : super(key: key);
  final String title;
  final String? subtitle;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: primaryColor,
                  fontSize: 25,
                  fontFamily: 'cairo',
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextButton(
                onPressed:onPressed,
                child: Text(
                  subtitle??'',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: scondaryColor,
                      fontSize: 16,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
