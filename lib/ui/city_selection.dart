import 'package:flutter/material.dart';

class AllCities extends StatefulWidget {
  const AllCities({super.key});

  @override
  State<AllCities> createState() => _AllCitiesState();
}

class _AllCitiesState extends State<AllCities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Your City")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 7, 5, 7),
            child: Container(
              height: 280,
              width: 160,
              // decoration: inputDecoration,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "dealsname",
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
