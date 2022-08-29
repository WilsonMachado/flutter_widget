import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Inputs y Forms'),
        ),
      ),
      body: SingleChildScrollView( // Funciona como un ListView, pero con un solo elemento. Y si el widget hijo supera las dimensiones de la pantalla, permite hacer scroll

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [

             // Se puede usar el TextField o el TRextFormField. El primero se usa cuando se requiere algo sin formulario, el segundo cuando se trabaja con formularios. Se recomienda trabajar con TextFormField en la mayoría de los casos porque permite agregar variaciones automáticas. El TextFormField posee más variaciones en un formulario.

            TextFormField(
              autofocus: false, // Para que al entrar en la screen del formulario, el cursor se posicione automáticamente allí

              initialValue: '', // Texto inicial en el Input

              textCapitalization: TextCapitalization.words, // Para que el texto 'Se Vea Así'

              onChanged: (value) { // value será lo que el usuario ingresa en el TextFormField
                print(value);
              },

              validator: (value) { // Sirve para realizar las validaciones del texto: si debe tener un número mínimo de caracteres, tener un formato definido (expresión regular), etc

              if ( value == null) return 'Este campo es obligatorio';

              return value.length < 3 ? 'Se requiere un mínimo de 3 caracteres' : null;
                
              },

              autovalidateMode: AutovalidateMode.onUserInteraction, // El validator requiere un disparador y este es el autoivalidateMode. La opción más natural es cuando el usuario interactúa con la app, es decir, onUserInteraction.

              decoration: const InputDecoration( // Para personalizar el TextFormField
               

                hintText: 'Nombre del usuario', // Similar al PlaceHolder en HTML5

                labelText: 'Nombre', // Para la indicación en el Input

                helperText: 'Solo letras', // Otro tipo de indicación

                counterText: '3 caracteres', // Contar el número de caracteres, puede servir también para indiciar cuántos caracteres le faltan al usuario

                suffixIcon: Icon(Icons.group_add_outlined), // Ícono a la derecha del InputText 

                //prefixIcon: Icon(Icons.verified_user_outlined), // Ícono a la izquierda del TextField

                icon: Icon(Icons.verified_user_outlined), // Ícono a la izquierda del TextField. La diferencia con el prefixIcon es que corre toda la línea a la derecha. Decomentar la línea del prefixIcon para apreciar lo anterior.
                /*
                border: OutlineInputBorder( // Permite cambiar los bordes del TextInput

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                  ),
                
                ),

                */

                 // Cambiar el color no es tan sencillo porque el TextInput tiene varios estados: cuando no está seleccionado, cuando está seleccionado, cuando da error, etc. Para cambiar el color cuando está seleccionado, por ejemplo:
                
                /*

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red // Ya quedó, pero fijarse que perdió la forma que se definió en el border. Lo mejor es establecer estilos globales para los TextFields.
                  ),
                ),

                */

              ),

            ),
          ],
        ),
      ),

      )
    );
  }
}