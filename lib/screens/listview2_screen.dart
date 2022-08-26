import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  const ListView2Screen({Key? key}) : super(key: key);

  final options = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy 7'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Center(
          child: Text('ListView2Screen AppBar'),
          )
        ),
      body: 
        Center(
          child: ListView.separated(
              // Sirve para iterar listas de forma 'perezosa' y añadir un separador. Si solo se quiere iterar, entonces usar el builder
              /// Con el ListView builder y el separated los elementos no se realizan de manera instantánea.
              itemBuilder: (context, index) => ListTile(
                    title: Text(options[index]),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.indigo,),
                    onTap: () {
                      final game = options[index];
                      print(game);
                    },
                  ), // Widget que quiero renderizar con la información que provenga del array
              // Los guiones representan variables que se pasan a la función (o método(?)) pero que no son usados en el procesamiento. Se acostumbra porque se ve más proooo
              separatorBuilder: (_, __) =>
                  const Divider(), // Widget para realizar la separación
              itemCount: options
                  .length // Cantidad de veces a iterar, por lo general length del arreglo
              ),
        ),
    );
  }
}
