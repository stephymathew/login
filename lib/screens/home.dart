import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        actions: [
          TextButton.icon(
              onPressed: () {
                dialogView(context);
              },
              icon: const Icon(
                Icons.login_outlined,
                color: Colors.black,
              ),
              label: const Text(
                'sign out',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: SafeArea(
          child: Expanded(
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
                  subtitle: const Text('active'),
                  title: Text('person$index',),
                  trailing: const Text('10 min ago'),
                  leading: index % 2 == 0
                      ? Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/flower.jpg'),
                                  fit: BoxFit.cover)),
                        )
                      : const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/flower.jpg'),
                        ),
                ),
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.black,
                ),
            itemCount: 10),
      )),
    );
  }
}

dialogView(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('logout'),
      content: const Text('Are you sure want to log out'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('cancel')),
        TextButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenLogin(),
                  ),
                  (route) => false);
            },
            child: const Text('logout'))
      ],
    ),
  );
}
