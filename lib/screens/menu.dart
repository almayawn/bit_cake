import 'package:flutter/material.dart';
import 'package:bit_cake/widgets/menu_card.dart';
import 'package:bit_cake/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {

  MyHomePage({Key? key}) : super(key: key);
  final List<MenuItem> items = [
    MenuItem("View Entry", Icons.assistant, const Color(0xFFE790AD)),
    MenuItem("Add Entry", Icons.create, Colors.teal.shade200),
    MenuItem("Logout", Icons.logout, Colors.black38),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Memory Bouquet',
        ),
        centerTitle: false,
        backgroundColor: Colors.teal.shade200,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Flower Entry',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF647B78),
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((MenuItem item) {
                  // Iterasi untuk setiap item
                  return MenuCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}