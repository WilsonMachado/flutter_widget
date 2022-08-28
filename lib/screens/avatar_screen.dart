import 'package:flutter/material.dart';
import 'package:flutter_widgets/themes/app_theme.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text('Avatars')),
        actions:  [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[900],
              backgroundImage: const NetworkImage('https://www.pngitem.com/pimgs/m/473-4736002_dont-starve-together-wilson-hd-png-download.png'), // 
              //child: const Text('WM'),
            ),
          )
        ],
      ),
      body: Center(
         child: Column(
           children: const [
             SizedBox(height: 200),
             CircleAvatar(
              maxRadius: 110, // Le da más redondeado a la imagen del avatar
              backgroundImage: NetworkImage('https://www.pngitem.com/pimgs/m/473-4736002_dont-starve-together-wilson-hd-png-download.png'), // Dirección de la imagen. Se podría probar agregando una imagen a los Assets
             ),
             Text("Wilson de Don't Starve Together"),
           ],
         ),
      ),
    );
  }
}