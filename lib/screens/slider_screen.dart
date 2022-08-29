import 'package:flutter/material.dart';
import 'package:flutter_widgets/themes/app_theme.dart';

// Para que el slider se actualice solo, es necesario que sea de tipo StatefulWidget

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Slider & Checks'),
        ),
      ),
      body: Column( //* Inicialmente se envolvió este Widget con un SingleChildScrollView, pero movía tanto el Slider como la imagen. Así que se removió
        children: [

          Slider.adaptive( // La propiedad adaptativa permite que, dependiendo del OS donde corre la aplicación, el widget se verá de una forma más 'nativa'. No todos los widgets lo tienen
              min: 0, // Valor mínimo del Slider
              max: 200, // Valor máximo del Slider
              activeColor: AppTheme.primary, // Color del Slider
              //*divisions: 10, // Divisiones para que se tengan saltos fijos en el Slider
              value: _sliderValue, // Valor inicial del Slider
              onChanged: _sliderEnabled 
                ? (value) {
                // Lo que ocurrirá al cambiar el valor del Slider
                _sliderValue = value;
                setState(() {});
                }
                : null
                ),

          Checkbox( // * Este checkbox no es tan bonito, así que se recomiendo usarlo poco
            
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value ?? true; // Se requiere la validación porque el valor booleano es opcional
              setState(() {});
            }
            ),

          CheckboxListTile( //* Este tampoco es tan bonito, así que meh
            title: const Text('Habilitar el slider'), // Sin embargo, permite añadirle un texto
            activeColor: AppTheme.primary, // Y colocarle colorsito
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value ?? true;
              setState(() {});
            }),

            //* Se recomienda trabajar más que todo con Switches, ya que son más estéticos

            Switch(
              value: _sliderEnabled,
              onChanged: (value) {
              _sliderEnabled = value; // Solo que acá el valor booleano sí tiene un valor por defecto y no es necesaria la validación
              setState(() {});
            }
            ),

            //* Y un Switch con texto

            SwitchListTile.adaptive( // También tiene la propiedad adaptativa dependiendo del SO donde se ejcute la aplicación
              title: const Text('Habilitar el slider'), // Sin embargo, permite añadirle un texto
              activeColor: AppTheme.primary, // Y colocarle colorsito
              value: _sliderEnabled,
              onChanged: (value) {
                _sliderEnabled = value;
                setState(() {});
              }
            ),

            const AboutListTile(), // Crea un About para la app de una manera fácil :3

          const SizedBox(height: 100,), //* Modificar este valor para que la imagen se salga de la pantalla y verificar que funciona el SingleChildScrollView
          
          // Si solo se quisiera que la imagen hiciera scroll, se hace necesario envolver la Imagen en un SingleChildScrollView. No obstante, si lo hacemos, nos vamos a dar cuenta que hay un error y es porque el SingleChildScrollView requiere conocer el tamaño al estar en una columna. Para decírselo, se debe envolver en un Expanded.
          
          Expanded(
            child: SingleChildScrollView(
               child: Image(
               image: const NetworkImage('https://static.wikia.nocookie.net/corajeelperrocobarde/images/1/1c/Coraje_el_perro_cobardepng.png/revision/latest?cb=20211110204145&path-prefix=es'),
               fit: BoxFit.contain, // Para que las dimensiones de la imagen varíen proporcionalmente (encapsularla en una caja)
               width: _sliderValue, // el ancho de la imagen varía con el valor del Slider
              ),
            ),
          ),
        ],
      ),
    );
  }
}
