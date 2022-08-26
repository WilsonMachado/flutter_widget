// Se acostumbra que las importaciones de Material y libs de terceros vayan arriba y las custom o propias vayan abajo
/// El orden es:
/// 1. Importaciones de Dart
/// 2. Importaciones de terceros como Material, Cupertino, etc
/// 3. Importaciones propias o custom

import 'package:flutter/material.dart';
import 'package:flutter_widgets/router/app_routes.dart';
import 'package:flutter_widgets/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      
      title: 'Flutter Widgets',
      
      theme: AppTheme.lightTheme,
      
      initialRoute: AppRoutes.initialRoute,
      
      routes: AppRoutes.getAppRoutes(), // es necesario definir la propiedad 'routes', de lo contrario dará error
      
      onGenerateRoute: AppRoutes.onGenerateRoute
    
    );
  }
}
