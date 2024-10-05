import 'package:flutter/material.dart';

class StatisticalPage extends StatefulWidget {
  const StatisticalPage({super.key});

  @override
  State<StatisticalPage> createState() => _StatisticalPageState();
}

class _StatisticalPageState extends State<StatisticalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text('statistical')],
      ),
    );
  }
}
