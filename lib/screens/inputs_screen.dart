import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * Esta es la primera vez que vamos a usar la key. Son usadas para mantener la referencia a un Widget
    // -- final GlobalKay<TipoDeKey> estadoAMantener = GlobalKay<TipoDeKey>() *Se repite para ser explícito
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'name': 'Wilson',
      'apellido': 'Machado',
      'email': 'wilson.machado@colbits.com.co',
      'password': '123456',
      'role': 'Admin'
    };

    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Inputs y Forms'),
          ),
        ),
        body: SingleChildScrollView(
          // Funciona como un ListView, pero con un solo elemento. Y si el widget hijo supera las dimensiones de la pantalla, permite hacer scroll

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key:
                  myFormKey, //* Acá se usa la key para mantener la referencia del formulario. Es decir, el estado del formulario se puede referenciar mediante este key
              child: Column(
                children: [
                  CustomInputField(
                    labelText: 'Nombre',
                    hintText: 'Nombre del usuario',
                    formProperty: 'name',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    labelText: 'Apellido',
                    hintText: 'Apellido del usuario',
                    formProperty: 'apellido',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    labelText: 'Correo',
                    hintText: 'Correo del usuario',
                    keyboardType: TextInputType.emailAddress,
                    formProperty: 'email',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    labelText: 'Contraseña',
                    hintText: 'Contraseña del usuario',
                    obsucureText: true,
                    formProperty: 'password',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   
                  DropdownButtonFormField<String>( // Menú desplegable
                    items: const[
                      DropdownMenuItem(value: 'Admin',child: Text('Admin')), // item del menú desplegable
                      DropdownMenuItem(value: 'User',child: Text('User')),
                      DropdownMenuItem(value: 'Guest',child: Text('Guest')),
                    ],
                    
                    onChanged: (value) => formValues['role'] = value ?? 'User', // Lo que se realiza cuando se selecciona un item del menú delplegable
                    
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  
                  ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(
                            FocusNode()); // Quitar el teclado al presionar el botón que dispara el formulario
                        if (!(myFormKey.currentState!.validate())) {
                          // Dispara las validaciones establecidas en los campos del formulario. El segundo signo de admiración es para decirle a Flutter: 'Confía en mí! Siempre habrá un estado al presionar el botón que dispara el formulario'
                          print('Formulario no válido');
                          return;
                        }
                        // TODO: imprimir valores del formulario!
                        print(formValues);
                      },
                      child: const Center(child: Text('Guardar')))
                ],
              ),
            ),
          ),
        ));
  }
}
