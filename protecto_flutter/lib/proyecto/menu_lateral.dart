import 'package:flutter/material.dart';
import 'package:protecto_flutter/proyecto/router/AppRoutes.dart';



class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 250,
            color: const Color.fromARGB(255, 3, 32, 62),

            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.person_outlined, size:80, color: Colors.white,),
                 const SizedBox(height: 20),
                const Text(
                  "ADMINISTRADOR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                Expanded(child: ListView(
                  children: [
                _crearOpcionMenu(context,Icons.home, "Inicio",Approutes.inicio ),
                _crearOpcionMenu(context,Icons.people, "Usuario",Approutes.usuario),
                _crearOpcionMenu(context,Icons.library_books, "Libros ",Approutes.libros),
                _crearOpcionMenu(context,Icons.library_books_outlined, "Prestamos", Approutes.prestamos),
                  ],
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

Widget _crearOpcionMenu(BuildContext context, IconData icono, String texto, String ruta) {
  return ListTile(
    leading: Icon(icono, color: Colors.white70),
    title: Text(texto, style: const TextStyle(color: Colors.white70)),
    onTap: () {
      Navigator.pushNamed(context, ruta);
    },
  );
}
