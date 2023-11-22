import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:bit_cake/models/cake.dart';
import 'package:bit_cake/widgets/left_drawer.dart';

import 'cake_detail.dart';

class FlowerListPage extends StatefulWidget {
  const FlowerListPage({Key? key}) : super(key: key);

  @override
  _FlowerListPageState createState() => _FlowerListPageState();
}

class _FlowerListPageState extends State<FlowerListPage> {
  Future<List<Flower>> fetchFlower() async {
    var url = Uri.parse(
        'https://alma-laras-tugas.pbp.cs.ui.ac.id/get-flower/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Flower> flowers = [];
    for (var d in data) {
      if (d != null) {
        flowers.add(Flower.fromJson(d));
      }
    }
    return flowers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Flower Entry',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          backgroundColor: Colors.teal.shade200,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchFlower(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "No flowers.",
                        style:
                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FlowerDetailPage(flower: snapshot.data![index]),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.amount}"),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.description}")
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }
        )
    );
  }
}