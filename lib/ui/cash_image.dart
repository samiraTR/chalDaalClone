import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CashImage extends StatefulWidget {
  const CashImage({super.key});

  @override
  State<CashImage> createState() => _CashImageState();
}

class _CashImageState extends State<CashImage> {
  List imageData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageSource();
  }

  getImageSource() async {
    imageData = await getImage();
    setState(() {});
  }

  Future<List> getImage() async {
    http.Response response;
    List imageData = [];
    try {
      response = await http.get(
          Uri.parse(
              'https://api.pexels.com/v1/search/?page=1&per_page=80&query=electronics'),
          headers: {
            'Authorization':
                'CiJrKvEoG0gTaH4b5BRpgMKD8Lsy7Uaefrxi41rNFDmXafwAVOFrdoBt'
          });

      var data = jsonDecode(response.body);
      imageData = data['photos'];
    } catch (e) {}

    return imageData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash Image'),
      ),
      body: imageData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: ListView.builder(
                itemCount: imageData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 120,
                            child: CachedNetworkImage(
                              imageUrl: imageData[index]['src']['small'],
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    // colorFilter: const ColorFilter.mode(
                                    //     Colors.red, BlendMode.colorBurn),
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(imageData[index]['alt']),
                            const SizedBox(height: 10),
                            Text('Credit: ${imageData[index]['photographer']}'),
                          ],
                        ))
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
