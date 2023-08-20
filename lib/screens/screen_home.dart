/*import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text('$index'),
                leading: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/flower.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 10),
    );
  }
}

*/