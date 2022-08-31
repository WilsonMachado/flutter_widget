import 'package:flutter/material.dart';
import 'package:flutter_widgets/themes/app_theme.dart';

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

  bool isLoading = false;

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
        //add5();
        fetchData(); // realiza la petición
      }
    });
  }

  //* En lugar de realizar la carga rápidamente, en la realidad existe un tiempo de espera entre la carga de las imágenes y la visualización de la App. Aquí se logra usando un Future

  Future fetchData() async {
    // Esto simula el tiempo de petición para llamar las variables

    if (isLoading) return; // Para que no esté todo el rato haciendo perticiones

    isLoading = true; // inicia la petición

    setState(() {});

    await Future.delayed(const Duration(seconds: 3)); // espera de 3 segundos

    add5(); // Llama a la función que carga imágenes adicionales

    isLoading = false; // termina la petición
    setState(() {});

    //* Si no estoy cerca del final, no hagas la animación

    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
        //* Animación para indicarle al usuario que siga haciendo scroll
        scrollController.position.pixels +
            120, //? A qué punto del nuevo scroll necesito moverme?
        duration: const Duration(milliseconds: 300), // Duración
        curve: Curves.fastOutSlowIn); // Tipo de animación
  }

  // Función para añadir elementos

  void add5() {
    final lastId = imagesIds.last; // toma el último valor del arreglo de IDs
    imagesIds.addAll([1, 2, 3, 4, 5]
            .map((e) => lastId + e) // se añaden 5 valores a la lista de IDs
        );
    setState(() {});
  }

  Future<void> onRefresh() async {
    // Future para realizar el refresh al hacer pull

    final lastID = imagesIds.last;
    await Future.delayed(const Duration(seconds: 2)); // espera de 2 segundos
    imagesIds.clear();
    imagesIds.add(lastID + 1);
    add5();
  }

  // 2. La creación del Statefulwidget como tal (creo, la verdad no lo mencionan)

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // determinar el tamaño del dispositivo donde está corriendo mi app

    return Scaffold(
      backgroundColor: Colors.black, // Color de fondo del Scaffold

      body: MediaQuery.removePadding(
        // Para eliminar los paddings de la pantalla por defecto

        context: context, // Requiere del context
        removeTop: true, // Quita el padding superior
        removeBottom: true, // Quita el padding inferior

        child: Stack(
          // Widget que apila Widgets xd
          children: [
            RefreshIndicator(
              // Permite recargar las imágenes al hacer pull (tirar hacia arriba)
              
              color: AppTheme.primary,
              
              onRefresh: onRefresh,
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
                            width:
                                double.infinity, // tomar todo el ancho posible
                            height: 300,
                            fit: BoxFit.cover, // Tomar todo el espacio
                            placeholder:
                                const AssetImage('assets/jar-loading.gif'),
                            image: NetworkImage(
                                'https://picsum.photos/500/300?image=${imagesIds[index]}') // PicSum es una API de imágenes aleatorias
                            ),
                      ],
                    );
                  }),
            ),
            if (isLoading) // Si está cargardo, muestra el loading. //?Nótese que el if no acepta {}, por lo tanto, solo se puede una instrucción. También soporta -else-

              Positioned(
                  //? Este es un Widget útil para posicionar otros Widgets dentro de una
                  bottom: 40,
                  left: (size.width / 2) -
                      30, //? Se toma la mitad del ancho del dispositivo y se le resta la mitad de las dimensiones del container para el ícono de carga
                  child: const _Loadingicon()),
          ],
        ),
      ),
    );
  }
}

class _Loadingicon extends StatelessWidget {
  const _Loadingicon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      // color: Colors.white, //*El color no puede junto al decoration, debe ir DENTRO del decoration
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          shape: BoxShape.circle //* También funciona la propiedad borderRadius
          ),
      child: const CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
