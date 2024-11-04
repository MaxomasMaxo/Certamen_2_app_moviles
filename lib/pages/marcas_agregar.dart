import 'package:flutter/material.dart';
import 'package:flutter_application_api_autos/provider/autos_provider.dart';

class MarcasAgregar extends StatefulWidget {
  const MarcasAgregar({super.key});

  @override
  State<MarcasAgregar> createState() => _MarcasAgregarState();
}

class _MarcasAgregarState extends State<MarcasAgregar> {
  TextEditingController nombreCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Marca'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              controller: nombreCtrl,
              decoration: InputDecoration(
                  labelText: 'Marca Autos', hintText: 'Nombre fabricante'),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent),
                  onPressed: () {
                    AutosProvider provider = AutosProvider();
                    provider.marcasAgregar(nombreCtrl.text);
                    Navigator.pop(context);
                    
                  },
                  child: Text('Agregar Marca')),
            )
          ],
        ),
      ),
    );
  }
}
