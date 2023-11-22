import 'package:flutter/material.dart';
import 'package:bit_cake/models/cake.dart';

class FlowerDetailPage extends StatelessWidget {
  final Flower flower;

  const FlowerDetailPage({Key? key, required this.flower}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(flower.fields.name),
        backgroundColor: Colors.teal.shade200,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${flower.fields.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Amount: ${flower.fields.amount}'),
            const SizedBox(height: 10),
            Text('Description: ${flower.fields.description}'),
          ],
        ),
      ),
    );
  }
}