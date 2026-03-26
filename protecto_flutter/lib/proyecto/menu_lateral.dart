import 'package:flutter/material.dart';
import 'package:protecto_flutter/proyecto/router/AppRoutes.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Container(
      width: 250,
      color: const Color.fromARGB(255, 3, 32, 62),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const Icon(
            Icons.person_outlined,
            size: 80,
            color: Colors.white,
          ),
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
          Expanded(
            child: ListView(
              children: [
                _crearOpcionMenu(
                  context,
                  Icons.home,
                  "Inicio",
                  Approutes.inicio,
                  currentRoute == Approutes.inicio,
                ),
                _crearOpcionMenu(
                  context,
                  Icons.people,
                  "Usuario",
                  Approutes.usuario,
                  currentRoute == Approutes.usuario,
                ),
                _crearOpcionMenu(
                  context,
                  Icons.library_books,
                  "Libros",
                  Approutes.libros,
                  currentRoute == Approutes.libros,
                ),
                _crearOpcionMenu(
                  context,
                  Icons.library_books_outlined,
                  "Prestamos",
                  Approutes.prestamos,
                  currentRoute == Approutes.prestamos,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _crearOpcionMenu(
  BuildContext context,
  IconData icono,
  String texto,
  String ruta,
  bool seleccionada,
) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 180),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: seleccionada ? const Color(0xFF114D85) : Colors.transparent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      leading: Icon(icono, color: Colors.white),
      title: Text(
        texto,
        style: TextStyle(
          color: Colors.white,
          fontWeight: seleccionada ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
      onTap: () {
        if (!seleccionada) {
          Navigator.pushReplacementNamed(context, ruta);
        }
      },
    ),
  );
}
