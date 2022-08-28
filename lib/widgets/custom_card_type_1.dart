import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.dashboard_outlined, color: AppTheme.primary,),
            title: Center(
              child: Text('Texto de prueba'),
            ),
            subtitle: Text('Incididunt laboris consectetur mollit irure.'),
          ),
          
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                
                TextButton(onPressed: () {
                  
                }, child: const Center(
                  child: Text('Cancel'),
                )),
                
                TextButton(onPressed: () {
                  
                }, child: const Center(
                  child: Text('Ok'),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}