import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Tarjetas :3')),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          
          SizedBox(height: 10),

          CustomCardType2(
            imageURL: 'http://www.nasa.gov/sites/default/files/thumbnails/image/web_first_images_release_0.png',
          
            description: 'Esta es la descripción de la imagen en la tarjeta',),
          
          SizedBox(height: 10), // Separación entre las Cards
          
          CustomCardType2(imageURL: 'https://www.ngenespanol.com/wp-content/uploads/2022/07/Captura-de-Pantalla-2022-07-15-a-las-8.58.08.png',),
         
          SizedBox(height: 10),
         
          CustomCardType2(imageURL: 'https://images.ecestaticos.com/YAZQThXX3pERtprX8Ou6C2HOZeY=/0x0:1200x682/1338x752/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F913%2F6f9%2Fbaa%2F9136f9baa1c8062bc57086ce0dea4405.jpg',),
          
        ],
      ),
    );
  }
}


