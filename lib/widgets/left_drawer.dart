import 'package:flutter/material.dart';
import 'package:bit_cake/screens/menu.dart';
import 'package:bit_cake/screens/cake_form.dart';
import 'package:bit_cake/models/cake.dart';

import '../screens/cake_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key, required this.cakes});

  final List<Cake> cakes;

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
                  'Bit Cake',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("A Cake for A Cake",
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
                    builder: (context) => MyHomePage(cakes : cakes),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.cake),
            title: const Text('View Cake'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CakeListPage(cakes : cakes),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.egg),
            title: const Text('Add Cake'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BakeryFormPage(cakes : cakes),
                  ));
            },
          ),
        ],
      ),
    );
  }
}