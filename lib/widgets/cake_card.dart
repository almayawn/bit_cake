import 'package:flutter/material.dart';
import 'package:bit_cake/models/cake.dart';

class CakeCard extends StatelessWidget {
  final Cake cake;

  const CakeCard(this.cake, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.cake),
          title: Text(cake.name),
          subtitle: Text(cake.description),
          trailing: Text("Amount: ${cake.amount}"),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
