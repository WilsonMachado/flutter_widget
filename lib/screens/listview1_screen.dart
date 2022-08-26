import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  const ListView1Screen({Key? key}) : super(key: key);

  final options = const [
    'Megaman', 'Metal Gear', 'Super Smash', 'Final Fantasy 7'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('ListView1Screen AppBar'),
      )),
      body: Center(
        child: ListView(
          // Los listview aguantan cualquier Widget, se le puede poner el que se desee
          children: [
            ...options.map( // Los puntos suspensivos 
              (game) => ListTile(
                // Si se pone leading, la flecha aparece a la izquierda del texto
                title: Text(game),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              )
            ).toList()
          ],
        ),
      ),
    );
  }
}
