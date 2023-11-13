import 'package:flutter/material.dart';
import 'package:bit_cake/screens/cake_form.dart';
import 'package:bit_cake/screens/cake_list.dart';
import 'package:bit_cake/models/cake.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Color color;

  MenuItem(this.name, this.icon, this.color);
}

class MenuCard extends StatelessWidget {
  final MenuItem item;
  final List<Cake> cakes;

  const MenuCard(this.item, {super.key, required this.cakes}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You have clicked ${item.name}!")));

            if (item.name == "Add Cake") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BakeryFormPage(cakes : cakes),
                ),
              );
            }

          if (item.name == "View Cake") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CakeListPage(cakes : cakes),
              ),
            );
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}