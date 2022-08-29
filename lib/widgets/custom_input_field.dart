import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText; // Similar al PlaceHolder en HTML5

  final String? labelText; // Para la indicación en el Input

  final String? helperText; // Otro tipo de indicación

  final String?
      counterText; // Contar el número de caracteres, puede servir también para indiciar cuántos caracteres le faltan al usuario

  final IconData? suffixIcon; // Ícono a la derecha del InputText

  final IconData? prefixIcon; // Ícono a la izquierda del TextField

  final IconData?
      icon; // Ícono a la izquierda del TextField. La diferencia con el prefixIcon es que corre toda la línea a la derecha. Decomentar la línea del prefixIcon para apreciar lo anterior.

  final TextInputType? keyboardType;

  final bool obsucureText;

  // Propiedades necesarias para capturar los valores del formulario

  final String formProperty;
  final Map<String, dynamic> formValues;

  const CustomInputField({
    Key? key,
    this.labelText,
    this.helperText,
    this.counterText,
    this.suffixIcon,
    this.prefixIcon,
    this.icon,
    this.hintText,
    this.keyboardType,
    this.obsucureText =
        false, // Si asigno una variable así, no puede ser required. Required solo hace falta si no garantizo la inicialización de variable para que quien use mi Widget (o clase) me envíe los parámetros que necesito sí o sí

    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Se puede usar el TextField o el TextFormField. El primero se usa cuando se requiere algo sin formulario, el segundo cuando se trabaja con formularios. Se recomienda trabajar con TextFormField en la mayoría de los casos porque permite agregar variaciones automáticas. El TextFormField posee más variaciones en un formulario.

    return TextFormField(
      autofocus:
          false, // Para que al entrar en la screen del formulario, el cursor se posicione automáticamente allí

      initialValue: '', // Texto inicial en el Input

      textCapitalization:
          TextCapitalization.words, // Para que el texto 'Se Vea Así'

      onChanged: (value) {
        // value será lo que el usuario ingresa en el TextFormField
        formValues[formProperty] = value;
        //* La propuedad que se pasa será el campo del Map. Este se añadirá y retornará el Map con las propuedades capturadas
      },

      validator: (value) {
        // Sirve para realizar las validaciones del texto: si debe tener un número mínimo de caracteres, tener un formato definido (expresión regular), etc

        if (value == null) return 'Este campo es obligatorio';

        return value.length < 3
            ? 'Se requiere un mínimo de 3 caracteres'
            : null;
      },

      autovalidateMode: AutovalidateMode
          .onUserInteraction, // El validator requiere un disparador y este es el autoivalidateMode. La opción más natural es cuando el usuario interactúa con la app, es decir, onUserInteraction.

      decoration: InputDecoration(
        // Para personalizar el TextFormField

        hintText: hintText, // Similar al PlaceHolder en HTML5

        labelText: labelText, // Para la indicación en el Input

        helperText: helperText, // Otro tipo de indicación

        counterText:
            counterText, // Contar el número de caracteres, puede servir también para indiciar cuántos caracteres le faltan al usuario

        suffixIcon: suffixIcon == null
            ? null
            : Icon(suffixIcon), // Ícono a la derecha del InputText

        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon), // Ícono a la izquierda del TextField

        icon: icon == null
            ? null
            : Icon(
                icon), // Ícono a la izquierda del TextField. La diferencia con el prefixIcon es que corre toda la línea a la derecha. Decomentar la línea del prefixIcon para apreciar lo anterior.

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

      keyboardType: keyboardType ??
          TextInputType
              .name, // Para cambiar el tipo de teclado dependiendo del Input Text que se necesita

      obscureText: obsucureText,
    );
  }
}
