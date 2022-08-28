import 'package:flutter/material.dart';
import 'package:flutter_widgets/themes/app_theme.dart';

class CustomCardType2 extends StatelessWidget {

  final String imageURL;
  final String? description;

  const CustomCardType2({Key? key, required this.imageURL, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      
      clipBehavior: Clip.antiAlias, // Cortan el contenido de la tarjeta para adecuarlo a la forma. Esto se hace para que la imagen no le quite los bordes redondeados a la card

      shape: RoundedRectangleBorder(  // Permite manipular los bordes de la tarjeta, su estilo y dimensiones
        borderRadius:  BorderRadius.circular(15)
      ),

      elevation: 20, // Cantidad de sombra

      shadowColor: AppTheme.primary.withOpacity(0.5), // Permite cambiar el color de la sombra, junto con la opacidad para quitarle 'fuerza'
      
      child: Column(
        children:  [
          // Para mostrar imágenes, se necesita un Widget que lo permita. 
          FadeInImage(  // Se se desea usar imagenes, se crea un directorio llamado comúnmente 'assets' y se debe añadir en el archivo pubspec.yaml. Cuando se guarden los cambios en el archivo .yaml, se debe hacer un full restart de la app para que los cambios sean tenidos en cuenta. El flutter pub get cargará el AssetImage para que se pueda usar.

              // La propiedad images permite añadir la imagen que se desea mostrar y la propiedad placeholder será la imagen de loading hasta que se pueda descargar o mostrar la imagen definitiva

              image: NetworkImage(imageURL), 
              
              placeholder: const AssetImage('assets/jar-loading.gif'),
              
              width: double.infinity, // El double.infinity toma todo el ancho posible. Solo funciona cuando el ancho es limitado, hay ocasiones en las que da error y solo se sabe con la práctica.

              height: 200,  // Valor tomado a prueba y error

              fit: BoxFit.cover, // Adapta la imagen a las dimensiones completas de la tarjeta

              fadeInDuration: const Duration(milliseconds: 300), // Duración de la animación de aparición de la imagen una vez cargada

            ),

            // Flutter permite que se ingresen condicionales dentro de los arreglos que representan los hijos (childrens) de los Widgets que lo permiten. Así, es posible renderizar widgets dependiendo de una condición dada:

            if (description != null)

              Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                child: Text(description ?? 'Imagen tomada por el telescopio James Webb'))
        ],
      )
    );
  }
}