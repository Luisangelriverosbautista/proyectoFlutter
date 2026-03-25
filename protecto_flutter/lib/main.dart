import 'package:flutter/material.dart';
import 'package:protecto_flutter/proyecto/router/AppRoutes.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:Approutes.inicio,
      routes: Approutes.getRoutes(),
 
    );
  }
}