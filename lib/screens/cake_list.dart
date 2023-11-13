import 'package:flutter/material.dart';

import 'package:bit_cake/models/cake.dart';
import 'package:bit_cake/widgets/cake_card.dart';
import 'package:bit_cake/widgets/left_drawer.dart';

class CakeListPage extends StatelessWidget {
  final List<Cake> cakes;

  const CakeListPage({Key? key, required this.cakes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cake List',
        ),
        centerTitle: false,
        backgroundColor: Colors.teal.shade200,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(cakes: cakes),
      body: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: cakes.length,
                  itemBuilder: (context, index) {
                    return CakeCard(cakes[index]);
                  },
                ),
              )
            ],
          ),
      ),
    );
  }
}