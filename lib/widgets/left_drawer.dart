import 'package:flutter/material.dart';
import 'package:bit_cake/screens/menu.dart';
import 'package:bit_cake/screens/cake_form.dart';

import '../screens/cake_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFE790AD),
            ),
            child: Column(
              children: [
                Text(
                  'Memory Bouquet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Used to be a cake shop. Now you just add flower entries.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Main Menu'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.assistant),
            title: const Text('View Entry'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FlowerListPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.create),
            title: const Text('Add Entry'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BakeryFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}