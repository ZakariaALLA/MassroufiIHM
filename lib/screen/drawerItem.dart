import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String itemTitle;
  String route;
  Icon icon;

  DrawerItem(this.itemTitle, this.route, this.icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
      leading: icon,
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.indigo[900],
      ),
      title: Text(
        itemTitle,
        style: TextStyle(fontSize: 18, color: Colors.indigo[900]),
      ),
    );
  }
}
