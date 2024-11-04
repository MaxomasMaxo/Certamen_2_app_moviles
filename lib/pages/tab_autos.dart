import 'package:flutter/material.dart';
import 'package:flutter_application_api_autos/pages/autos_detalles.dart';
import 'package:flutter_application_api_autos/provider/autos_provider.dart';
import 'package:flutter_application_api_autos/pages/autos_agregar.dart'; // Agregar este import

class TabAutos extends StatefulWidget {
  const TabAutos({super.key});

  @override
  State<TabAutos> createState() => _TabAutosState();
}

class _TabAutosState extends State<TabAutos> {
  AutosProvider provider = AutosProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaciado entre los elementos
              children: [
                Text(
                  'Detalle',
                  style: TextStyle(fontWeight: FontWeight.bold), // Estilo para mayor claridad
                ),
                Text(
                  'Auto',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Precio',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: provider.getAutos(), 
              builder: (context, AsyncSnapshot snapshot){
                if(!snapshot.hasData){
                  return Center(
                    child: Container(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Cargando...'),LinearProgressIndicator()
                        ],
                      ),
                    ),
                  );
                }else{
                  return ListView.separated(
                    itemBuilder: (context,index){
                      return ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2.0), // Color y grosor del contorno
                            borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
                          ),
                          child: IconButton(
                            icon: Icon(Icons.directions_car),
                            onPressed: () {
                              MaterialPageRoute route = MaterialPageRoute(
                                builder: (context) => AutosDetalles(
                                  patente: snapshot.data[index]['patentes'],
                                  modelo: snapshot.data[index]['modelo'],
                                  precio: snapshot.data[index]['precio'].toDouble(),
                                  marca: snapshot.data[index]['marca']['nombre'],
                                ),
                              );
                              Navigator.push(context, route).then(
                                (value) => setState(() {}),
                              );
                            },
                          ),
                        ),
                        title: Center(
                          child: Text(snapshot.data[index]['patentes']),
                        ),
                        subtitle: Center(
                          child: Text(snapshot.data[index]['modelo']),
                        ),
                        trailing: Text('${snapshot.data[index]['precio'].toString()} CLP'),
                      );
                    }, 
                    separatorBuilder: (_,__)=>Divider(), 
                    itemCount: snapshot.data.length);
                }
              }
            ),
          ),
        ], 
      ),
      floatingActionButton: FloatingActionButton( // Agregar FloatingActionButton
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => AutosAgregar(),
          );
          Navigator.push(context, route).then(
            (value) => setState(() {}),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showSnackBar(String mensaje){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(mensaje))
    );
  }  
  
}