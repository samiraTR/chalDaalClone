import 'package:flutter/material.dart';

class VitListScreen extends StatefulWidget {
  const VitListScreen({super.key});

  @override
  State<VitListScreen> createState() => _VitListScreenState();
}

class _VitListScreenState extends State<VitListScreen> {
  @override
  void initState() {
    
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Area List"),
      ),
      //body: ,
    );
  }
}