import 'package:flutter/material.dart';

class DrawerAbout extends StatelessWidget {
  const DrawerAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de la UTFSM'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logoUSM.png',
              width: 150, 
            ),
            SizedBox(height: 20),
            Text(
              'La Universidad Técnica Federico Santa María (UTFSM) es una universidad pública chilena, fundada en 1931, que se destaca por su enfoque en la formación de ingenieros y profesionales en áreas técnicas y científicas. La UTFSM ofrece una amplia gama de programas de pregrado y postgrado, y es reconocida por su excelencia académica y su compromiso con la investigación y el desarrollo tecnológico.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}