// drawer_menu.dart
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF004B85),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/logoUSM.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'Menú',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.leaderboard),
            title: Text('Marcas'),
            onTap: () {
              Navigator.pop(context);
              DefaultTabController.of(context).animateTo(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text('Autos'),
            onTap: () {
              Navigator.pop(context);
              DefaultTabController.of(context).animateTo(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Sobre Nosotros'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}