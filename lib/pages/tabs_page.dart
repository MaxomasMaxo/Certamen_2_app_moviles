import 'package:flutter/material.dart';
import 'package:flutter_application_api_autos/pages/drawer_screen.dart';
import 'package:flutter_application_api_autos/pages/tab_autos.dart';
import 'package:flutter_application_api_autos/pages/tab_marcas.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('API AUTOS',style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFFF7AE00),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () { Scaffold.of(context).openDrawer(); },
                //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          bottom: TabBar(tabs: [
            Tab(text: 'Marcas',),
            Tab(text: 'Autos')
          ])
          ,
          
          
        ),
        drawer: DrawerScreen(),
        body: TabBarView(
          children: [
            TabMarcas(),
            TabAutos()
          ]
        ),
      ),
    );
  }
}