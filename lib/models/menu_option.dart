// La idea de este archivo es contar con un template para llamar a las rutas que harán parte de la app

import 'package:flutter/material.dart' show IconData, Widget;

class MenuOption {
  final String route; // Ruta de la screen que quiero mostrar
  final IconData icon; // Ícono asociado al menú
  final String name; // Nombre que se mostrará al llamar la screen
  final Widget screen; // Widget que contiene la screen a mostrar

  // Método constructor: es necesario establecer el required porque al ser propiedades de tipo final, deben estar inicializadas obligatoriamente. Las {} indican que las propiedades se pueden pasar sin importar el orden.

  MenuOption(
      {required this.route,
      required this.icon,
      required this.name,
      required this.screen});
}
