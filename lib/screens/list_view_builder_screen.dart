import 'package:flutter/material.dart';

// Para realizar un scroll infnito, se requiere que la clase sea extendida del StatefulWidget

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  
  final List<int> imagesIds = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
  ]; // Arreglo para pedir las IDs de las imágenes

  //* Cómo hago para saber que estoy llegando a las 10 imágenes?
  //* R/. Por lo general, los widets que permiten hacer scroll tienen un controlador

  final ScrollController scrollController = ScrollController();

  // A través del scrollController puedo saber el valor del ListView en todo momento. Para poder usar esa información, se hace necesario crear un *listener* para escuchar en todo momento el scroll

  ///* Para ello, en los StatefulWidgets se tienen 2 pasos de vida importantes:
  /// 1. Cuando el state se crea por primera y única vez:
  @override
  void initState() {
    /// Aqui  se toma el scrollController y se añade un Listener
    super.initState();

    // Ahora, se debe realizar la acción necesaria para añadir los elementos a la imagen; en este caso, se crea un método:

    scrollController.addListener(() {
      print(
          '${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      // Es decir, imprimirá los pixeles en el momento de hacer scroll y los pixeles máximos en todo momento. Nótese que al llegar al final, estos dos valores son iguales; esta es la clave.
      // Como nota importante, en este estado inicial, si se hace un cambio, es necesario realizar un full restart

      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        add5();
      }
    });
  }

  // Función para añadir elementos

  void add5() {
    final lastId = imagesIds.last; // toma el último valor del arreglo de IDs
    imagesIds.addAll([1, 2, 3, 4, 5]
            .map((e) => lastId + e) // se añaden 5 valores a la lista de IDs
        );
    setState(() {});
  }

  // 2. La creación del Statefulwidget como tal (creo, la verdad no lo mencionan)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Color de fondo del Scaffold

      body: MediaQuery.removePadding(
        // Para eliminar los paddings de la pantalla por defecto

        context: context, // Requiere del context
        removeTop: true, // Quita el padding superior
        removeBottom: true, // Quita el padding inferior

        child: ListView.builder(
            controller: scrollController,
            physics:
                const BouncingScrollPhysics(), // Para dar el efecto de rebote como en IOS al estar en Android
            itemCount: imagesIds.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  FadeInImage(
                      width: double.infinity, // tomar todo el ancho posible
                      height: 300,
                      fit: BoxFit.cover, // Tomar todo el espacio
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(
                          'https://picsum.photos/500/300?image=${imagesIds[index]}') // PicSum es una API de imágenes aleatorias
                      ),
                ],
              );
            }),
      ),
    );
  }
}
