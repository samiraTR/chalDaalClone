import 'package:flutter/material.dart';

class SearchproductScreen extends StatefulWidget {
  const SearchproductScreen({super.key});

  @override
  State<SearchproductScreen> createState() => _SearchproductScreenState();
}

class _SearchproductScreenState extends State<SearchproductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Search"),
      ),
      body: Column(
        children: [],
      ),
      bottomNavigationBar: null,
    );
  }
}
