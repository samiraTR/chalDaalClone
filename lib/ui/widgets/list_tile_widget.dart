import 'package:flutter/material.dart';
import 'package:tst_app2/utils/theme.dart';

class ListTileWidget extends StatelessWidget {
  IconData icon;
  IconData trailingIcon;
  String tileName;
  VoidCallback? ontap;
  ListTileWidget(
      {Key? key,
      required this.trailingIcon,
      required this.icon,
      required this.tileName,
     
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,color: mainColor,),
      trailing: Icon(trailingIcon),
      onTap: ontap,
      title: Text(
        tileName,
        style:  TextStyle(fontWeight: FontWeight.bold,color: mainColor),
      ),
    );
  }
}
