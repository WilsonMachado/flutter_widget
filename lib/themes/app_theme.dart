// Este archivo representa el tema global de la aplicación. se recomienda usar un archivo por cada tema que se desee en la aplicación
// No se crea el archivo de barril porque, para este ejemplo, solo se tiene un archivo de temas. Si se tiene más de uno, usar un archivo barril

import 'package:flutter/material.dart';

class AppTheme {
  
  static const Color primary = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    
    // Color primario. Hay Widgets que usan este color por defecto, pero no es el caso del AppBar
    primaryColor: primary, 
    
    // Tema de las AppBars que no tengan parámetros custom
    appBarTheme: const AppBarTheme( 
      color: primary,
      elevation: 0
    ),
    
    // Text buttons
    
    textButtonTheme: TextButtonThemeData(

      style: TextButton.styleFrom(primary: primary),

    ),

    // Floating Actions Buttons

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 10
    ),

    // Elevated button

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        
        primary: primary,
        
        shape: const StadiumBorder(), // Para que no sea cuadrado por defecto. Con la propiedad side se pueden definir cada uno de los lados
        
        elevation: 0
      )
    ),

  );
}
