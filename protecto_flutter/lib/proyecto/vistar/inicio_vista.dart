import 'package:flutter/material.dart';
import 'package:protecto_flutter/proyecto/menu_lateral.dart';

class InicioVista extends StatelessWidget {
  const InicioVista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
        
          Expanded( child: MenuLateral()),

          
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                const SizedBox(height: 20), 
                Text(
                  "Bienvenido a la Biblioteca",
                  style: const TextStyle(
                    fontFamily: 'italic',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                 
                ),


                
SizedBox(height: 20),

                Expanded(
                  child: Image.asset(
                    'assets/libros.jpg',
                      width: 900,   // ancho fijo
                      height: 100,
  
  fit: BoxFit.cover,
                    
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
