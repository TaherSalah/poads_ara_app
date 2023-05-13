import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('ابحث عن الموضوع',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cairo')),
              const SizedBox(
                height: 70,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText:
                        ' اكتب كلمة مفتاحية عن الموضوع الذي تريد الاستماع اليه الان',
                    helperStyle: const TextStyle(fontFamily: 'cairo'),
                    label: const Text(
                      'ابحث الان',
                      style: TextStyle(
                          fontFamily: 'cairo', fontWeight: FontWeight.bold),
                    ),
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.search),
                label: const Text(
                  'ابحث الان',
                  style: TextStyle(
                      fontFamily: 'cairo', fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    mouseCursor: const MaterialStatePropertyAll(
                        MaterialStateMouseCursor.clickable),
                    overlayColor: MaterialStatePropertyAll(Colors.amber[900]),
                    shadowColor: const MaterialStatePropertyAll(Colors.black12),
                    elevation: const MaterialStatePropertyAll(10),
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(25))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
