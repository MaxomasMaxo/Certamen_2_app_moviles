import 'package:flutter/material.dart';
import 'package:flutter_application_api_autos/provider/autos_provider.dart';

class AutosAgregar extends StatefulWidget {
  const AutosAgregar({super.key});

  @override
  State<AutosAgregar> createState() => _AutosAgregarState();
}

class _AutosAgregarState extends State<AutosAgregar> {
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController modeloCtrl = TextEditingController();
  TextEditingController precioCtrl = TextEditingController();
  String? marcaCtrl;
  AutosProvider provider = AutosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Auto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              controller: nombreCtrl,
              decoration: InputDecoration(
                  labelText: 'Patente', hintText: 'Patente del Auto'),
            ),
            TextField(
              controller: modeloCtrl,
              decoration: InputDecoration(
                  labelText: 'Modelo', hintText: 'Modelo del Auto'),
            ),
            TextField(
              controller: precioCtrl,
              decoration: InputDecoration(
                  labelText: 'Precio', hintText: 'Valor del Auto'),
            ),
            FutureBuilder(
              future: provider.getMarcas(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Container(
                    width: double.infinity,
                    child: DropdownButton<String>(
                      value: marcaCtrl,
                      onChanged: (value) {
                        setState(() {
                          marcaCtrl = value; 
                        });
                      },
                      hint: Text('Marca'), 
                      items: snapshot.data?.map<DropdownMenuItem<String>>((marca) {
                        return DropdownMenuItem<String>(
                          child: Text(
                            '${marca['nombre']}'
                          ),
                          value: marca['id'].toString(),
                        );
                      }).toList(),
                    ),
                  );
                }
              },
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent),
                  onPressed: () {
                    double precio = double.parse(precioCtrl.value.text);
                    if (precio >= 0 && marcaCtrl != null) {
                      provider.autosAgregar(nombreCtrl.text, modeloCtrl.text, precio, int.parse(marcaCtrl!));
                      Navigator.pop(context);
                    } 
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Por favor, ingrese un precio válido.')),
                      );
                    }
                  },
                  child: Text('Agregar Marca')),
            )
          ],
        ),
      ),
    );
  }
}