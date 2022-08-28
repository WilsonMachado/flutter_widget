import 'dart:math';

import 'package:flutter/material.dart';

// Este Widget será Stateful porque se cambiarán propiedades que no se han visto en las anteriores. El animator container trabaja bien, ya que el Stateful mantiene su estado, como ya se ha visto

class AnimatedScreen extends StatefulWidget {


 const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  // En un StatefulWidget, las props van aquí, no arriba. Mi error. No olvidar! Lo mismo con los métodos

  double _width = 50; // Propiedad privada, ya que lleva el _ al principio
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void changeShape(){
    
    final random = Random();

    _width = random.nextInt(300).toDouble() + 70; // Se toma un número aleatorio para cambiar el ancho y el alto. El valor estará entre 0 y 300. Se le suma 70 para que nunca sea cero

    _height = random.nextInt(300).toDouble() + 70;

    _color = Color.fromRGBO(
     random.nextInt(255),
     random.nextInt(255),
     random.nextInt(255),
     1);

    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Animated Screen'),
        ),
      ),
      body: Center(
         child: AnimatedContainer( // Se puede comparar con el div en HTML
            //color: Colors.red, OJO: No se puede tener un color y un decoration al mismo tiempo. El color debe ir dentro del decoration: BoxDecoration
           
           // Para usar animaciones, basta con cambiar el Container por un AnimatedContainer. Se debe añadir el campo obligatorio de duration

            duration: const Duration(milliseconds: 400), // Duración de la animación
            curve: Curves.bounceOut, // Aquí se puede cambiar la animación. Más en: https://api.flutter.dev/flutter/animation/Curves-class.html
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_circle_outline_outlined, size: 35,),
        ),
    );
  }
}