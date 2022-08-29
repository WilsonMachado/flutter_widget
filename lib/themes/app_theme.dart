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

    // Inputs Decorations

    inputDecorationTheme: const InputDecorationTheme(
      
      floatingLabelStyle: TextStyle( color: primary ),// No el de behavior porque ese es de comportamiento
      
      enabledBorder: OutlineInputBorder( // Bordes cuando el TextInput está habilitado
        
        borderSide: BorderSide( color: primary ), // Color de bordes
        
        borderRadius: BorderRadius.only( // Forma de los bordes
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10)
        ),
      ),

      focusedBorder: OutlineInputBorder( // Bordes cuando el TextInput está seleccionado
        
        borderSide: BorderSide( color: primary ), // Color de bordes
        
        borderRadius: BorderRadius.only( // Forma de los bordes
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10)
        ),
      ),

      border: OutlineInputBorder( // Bordes cuando el TextInput no está seleccionado
        
        borderRadius: BorderRadius.only( // Forma de los bordes
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10)
        ),
      ),
      
        
    ),

    

  );
}
