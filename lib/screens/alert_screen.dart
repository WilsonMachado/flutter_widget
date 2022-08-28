import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);
  
  void displayDialogIOS(BuildContext context) {

    // Para mostrar un díalogo se hace uso de showDialog. Sin embargo, requiere del contexto y, al estar en un StatelessWidget, no se tiene durante todo el state. Por este motivo, se debe pasar el context al momento de llamar a este método. Recordar que se prefiere trabajar con StatelessWidget hasta donde sea posible.

    showCupertinoDialog(
      
      barrierDismissible: false, // Permite cerrar el diálogo al tocar la sombra
      
      context: context,
      
      builder: ( context ) { // El builder es una porción de código que regresa un Widget. Requiere también del context

        return  CupertinoAlertDialog(
        
          // Este no tiene ni elevation, ni shape
              
          title: const Text('Alerta!'),
          
          content: Column(
            
            mainAxisSize: MainAxisSize.min, // Limita el tamaño de la alerta al tamaño de los hijos
            
            children: const [
              Text('Este es el contenido de la alerta'),
              SizedBox(height: 20),
              FlutterLogo(size: 100,),
            ],
          ),
          
          actions: [ // Lo que deseo que haga la alerta, son Widgets

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar', style: TextStyle(color: Colors.red))
            ),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Okay')
            )
          
          ],
        );

      }  

    );

  }
  void displayDialogAndroid(BuildContext context) {

    // Para mostrar un díalogo se hace uso de showDialog. Sin embargo, requiere del contexto y, al estar en un StatelessWidget, no se tiene durante todo el state. Por este motivo, se debe pasar el context al momento de llamar a este método. Recordar que se prefiere trabajar con StatelessWidget hasta donde sea posible.

    showDialog(
      
      barrierDismissible: false, // Permite cerrar el diálogo al tocar la sombra
      
      context: context,
      
      builder: ( context ) { // El builder es una porción de código que regresa un Widget. Requiere también del context

        return  AlertDialog(
        
          elevation: 5,
          
          title: const Text('Alerta!'),
          
          shape: RoundedRectangleBorder ( borderRadius: BorderRadiusDirectional.circular(20) ), // Bordes de la alerta

          content: Column(
            
            mainAxisSize: MainAxisSize.min, // Limita el tamaño de la alerta al tamaño de los hijos
            
            children: const [
              Text('Este es el contenido de la alerta'),
              SizedBox(height: 20),
              FlutterLogo(size: 100,),
            ],
          ),
          
          actions: [ // Lo que deseo que haga la alerta, son Widgets

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Okay')
            )
          
          ],
        );

      }  

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         
         child: ElevatedButton(
          
          // Se pasa el context como referencia. Se pregunta si la plataforma es Andoid o IOS para mostrar la alerta de acuerdo al sistema operativo

          onPressed: () => !Platform.isAndroid 
                                    ? displayDialogAndroid(context)
                                    : displayDialogIOS( context ), 
         
         child: const Padding(
           padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20 ),
           child:  Text('Mostrar alerta', style: TextStyle( fontSize: 20),),
           
          )
         ),
      ),
      floatingActionButton: FloatingActionButton( // El floating action button NO es un widget. Es una propiedad de un widget, específicamente del Scaffold
        onPressed: () => Navigator.pop(context),  // Regresa a la última pantalla en el stack (pantalla anterior)
        child: const Icon(Icons.keyboard_return),
    )
    );
  }
}