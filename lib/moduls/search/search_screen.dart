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
              SizedBox(
                height: 70,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText:
                        ' اكتب كلمة مفتاحية عن الموضوع الذي تريد الاستماع اليه الان',
                    helperStyle: TextStyle(fontFamily: 'cairo'),
                    label: Text(
                      'ابحث الان',
                      style: TextStyle(
                          fontFamily: 'cairo', fontWeight: FontWeight.bold),
                    ),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.search),
                label: Text(
                  'ابحث الان',
                  style: TextStyle(
                      fontFamily: 'cairo', fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    mouseCursor: MaterialStatePropertyAll(
                        MaterialStateMouseCursor.clickable),
                    overlayColor: MaterialStatePropertyAll(Colors.amber[900]),
                    shadowColor: MaterialStatePropertyAll(Colors.black12),
                    elevation: MaterialStatePropertyAll(10),
                    padding: MaterialStatePropertyAll(EdgeInsets.all(25))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
