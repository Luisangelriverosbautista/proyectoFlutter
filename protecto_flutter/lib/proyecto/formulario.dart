import 'package:flutter/material.dart';

class FormularioGenerico extends StatelessWidget {
  final List<String> campos;
  final Map<String, String>? inicial;

  const FormularioGenerico({super.key, required this.campos, this.inicial});

  @override
  Widget build(BuildContext context) {
    final controllers = {
      for (var c in campos)
        c: TextEditingController(text: inicial?[c] ?? "")
    };

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Formulario", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          ...campos.map((c) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextField(
              controller: controllers[c],
              decoration: InputDecoration(
                labelText: c,
                border: const OutlineInputBorder(),
              ),
            ),
          )),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    for (var c in campos) c: controllers[c]!.text
                  });
                },
                child: const Text("Guardar"),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, null),
                child: const Text("Cancelar"),
              ),
            ],
          )
        ],
      ),
    );
  }
}