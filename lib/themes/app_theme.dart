// Este archivo representa el tema global de la aplicación. se recomienda usar un archivo por cada tema que se desee en la aplicación
// No se crea el archivo de barril porque, para este ejemplo, solo se tiene un archivo de temas. Si se tiene más de uno, usar un archivo barril

import 'package:flutter/material.dart';

class AppTheme {
  
  static const Color primary = Colors.green;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    
    primaryColor: primary, // Color primario. Hay Widgets que usan este color por defecto, pero no es el caso del AppBar
    
    appBarTheme: const AppBarTheme( // Tema de las AppBars que no tengan parámetros custom
      color: primary,
      elevation: 0
    )
  );
}
