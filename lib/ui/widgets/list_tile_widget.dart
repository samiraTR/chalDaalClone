import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  String image;
  IconData icon;
  String tileName;
  VoidCallback? ontap;
  ListTileWidget(
      {Key? key,
      this.image = " ",
      required this.icon,
      required this.tileName,
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        height: 30,
        width: 30,
      ),
      trailing: Icon(icon),
      onTap: ontap,
      title: Text(
        tileName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
