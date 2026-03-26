import 'package:flutter/material.dart';
import 'package:protecto_flutter/proyecto/menu_lateral.dart';

class InicioVista extends StatelessWidget {
  const InicioVista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const MenuLateral(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Bienvenido a la Biblioteca",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Gestiona usuarios, libros y prestamos desde un solo panel.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Expanded(
                        child: _MetricCard(
                          titulo: "Usuarios",
                          valor: "24",
                          icono: Icons.people,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _MetricCard(
                          titulo: "Libros",
                          valor: "138",
                          icono: Icons.menu_book,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _MetricCard(
                          titulo: "Prestamos Activos",
                          valor: "16",
                          icono: Icons.assignment_returned,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/libros.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withValues(alpha: 0.08),
                                    Colors.black.withValues(alpha: 0.48),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 18,
                            right: 18,
                            bottom: 18,
                            child: Text(
                              "Panel administrativo listo para operar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;

  const _MetricCard({
    required this.titulo,
    required this.valor,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Row(
          children: [
            Icon(icono, size: 28, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valor,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    titulo,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
