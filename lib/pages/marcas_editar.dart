import 'package:flutter/material.dart';
import 'package:flutter_application_api_autos/provider/autos_provider.dart';

class MarcasEditar extends StatefulWidget {
  final int id;
  final String nombre;
  const MarcasEditar({super.key,this.id=0,this.nombre=''});

  @override
  State<MarcasEditar> createState() => _MarcasEditarState();
}

class _MarcasEditarState extends State<MarcasEditar> {
  TextEditingController nombreCtrl = TextEditingController();
  String textoError='';
  @override
  void initState(){
    super.initState();
    nombreCtrl.text = widget.nombre;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Marca'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              controller: nombreCtrl,
              decoration: InputDecoration(
                labelText: 'Marca Auto',
                hintText: 'Nombre fabricante'
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent
                ),
                onPressed: ()async{
                  AutosProvider provider = AutosProvider();
                  provider.marcasEditar(widget.id, nombreCtrl.text);
                  Navigator.pop(context);
                }, 
                child: Text('Editar')),
            )
          ],
        ),
        ),
    );
  }
}