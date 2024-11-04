import 'package:flutter/material.dart';
import 'package:flutter_application_api_autos/pages/drawer_about.dart';
import 'package:flutter_application_api_autos/pages/tabs_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => TabsPage(),
        '/about': (context) => DrawerAbout(),

      },
      initialRoute: '/',
      
    );
  }
}