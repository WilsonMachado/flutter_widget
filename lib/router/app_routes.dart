// El objetivo de este archivo es que las rutas de la aplicación queden como métodos estáticos para facilitar su uso

import 'package:flutter/material.dart';
import 'package:flutter_widgets/models/models.dart';
import 'package:flutter_widgets/screens/screen.dart';

class AppRoutes {
  // Si escribiera _AppRoute significa que la clase es privada. De lo contrario, se está exportando implícitamente

  static String get initialRoute =>
      '/'; // Considerar la ruta inicial como '/' en lugar de '/home' o algo así

  static final menuOptions = <MenuOption>[
      
    MenuOption(
        route: '/listview1',
        name: 'List Tipo 1',
        screen: const ListView1Screen(),
        icon: Icons.list_alt_outlined),

    MenuOption(
        route: '/listview2',
        name: 'List Tipo 2',
        screen: const ListView2Screen(),
        icon: Icons.view_list_outlined),

    MenuOption(
        route: '/card',
        name: 'Cards - Tajetas',
        screen: const CardScreen(),
        icon: Icons.border_all_outlined),

    MenuOption(
        route: '/alert',
        name: 'Alerts - Alertas',
        screen: const AlertScreen(),
        icon: Icons.sd_card_alert_sharp),
    
    MenuOption(
        route: '/avartar',
        name: 'Avatar',
        screen: const AvatarScreen(),
        icon: Icons.person_outline_outlined),

    MenuOption(
        route: '/animated',
        name: 'Animated Screen',
        screen: const AnimatedScreen(),
        icon: Icons.smart_screen),

  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() { // Esto es un método, es decir, una función global y por ende debe llevar los (). IMPORTANTE RECORDAR

    Map<String, Widget Function(BuildContext)> appRoutes = {};
      
      appRoutes.addAll({'/': (BuildContext context) => const HomeScreen()}); // de esta manera no aparece el Home Screen en el menú. También ser removió del arreglo 'menuOptions'.

      for (final option in menuOptions){
        appRoutes.addAll({option.route: (BuildContext context) => option.screen});
      }

    return appRoutes;

  }
  /*
    ESTO ES OTRA FORMA DE HACER EL MNÚ OPTIONS, PERO DE ESTA MANERA ES MÁS DIFÍCIL DE MANTENER LA APLICACIÓN CUANDO APAREZCAN MÁS RUTAS

    static Map<String, Widget Function(BuildContext)> routes = {
    '/alert': (context) => const AlertScreen(),
    '/card': (context) => const CardScreen(),
    '/': (context) => const HomeScreen(),
    '/listview1': (context) => const ListView1Screen(),
    '/listview2': (context) => const ListView2Screen(),
  };*/

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print(settings);
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
