import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  final double days = 30;
  final String name = "nimra amjad";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Center(
        child: Material(
          child: Text("Welcome to my $days days of flutter by $name"),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
