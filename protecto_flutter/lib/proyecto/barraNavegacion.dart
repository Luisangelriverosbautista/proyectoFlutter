import 'package:flutter/material.dart';

class BarraSuperior extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onBuscar;
  final VoidCallback onAgregar;
  final String titulo;

  const BarraSuperior({
    super.key,
    required this.controller,
    required this.onBuscar,
    required this.onAgregar,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    final actionButtonStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(120, 44),
    );

    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(titulo, style: const TextStyle(fontSize: 24)),
                  ElevatedButton(
                    onPressed: onAgregar,
                    style: actionButtonStyle,
                    child: const Text("Agregar"),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Buscar...",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: onBuscar,
                    style: actionButtonStyle,
                    child: const Text("Buscar"),
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}