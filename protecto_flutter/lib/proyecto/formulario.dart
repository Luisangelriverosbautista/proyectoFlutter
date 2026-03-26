import 'package:flutter/material.dart';

class FormularioGenerico extends StatefulWidget {
  final List<String> campos;
  final Map<String, String>? inicial;
  final String? titulo;
  final IconData? icono;

  const FormularioGenerico({
    super.key,
    required this.campos,
    this.inicial,
    this.titulo,
    this.icono,
  });

  @override
  State<FormularioGenerico> createState() => _FormularioGenericoState();
}

class _FormularioGenericoState extends State<FormularioGenerico> {
  late Map<String, TextEditingController> controllers;
  late Map<String, bool> camposValidos;

  @override
  void initState() {
    super.initState();
    controllers = {
      for (var c in widget.campos)
        c: TextEditingController(text: widget.inicial?[c] ?? "")
    };
    camposValidos = {for (var c in widget.campos) c: true};
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  bool _validarFormulario() {
    bool valido = true;
    for (var c in widget.campos) {
      final texto = controllers[c]!.text.trim();
      final esValido = texto.isNotEmpty;
      setState(() => camposValidos[c] = esValido);
      if (!esValido) valido = false;
    }
    return valido;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (widget.icono != null) ...[
                Icon(widget.icono, size: 28, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(
                  widget.titulo ?? "Formulario",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...widget.campos.map((c) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controllers[c],
                  decoration: InputDecoration(
                    labelText: c,
                    hintText: "Ingresa $c",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: camposValidos[c]!
                            ? const Color(0xFFCFD4DC)
                            : Colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: camposValidos[c]!
                            ? const Color(0xFFCFD4DC)
                            : Colors.red,
                        width: camposValidos[c]! ? 1 : 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: camposValidos[c]!
                            ? Theme.of(context).colorScheme.primary
                            : Colors.red,
                        width: 2,
                      ),
                    ),
                    suffixIcon: camposValidos[c]!
                        ? null
                        : const Icon(Icons.error_outline, color: Colors.red),
                  ),
                  onChanged: (_) {
                    setState(() {
                      final texto = controllers[c]!.text.trim();
                      camposValidos[c] = texto.isNotEmpty;
                    });
                  },
                ),
                if (!camposValidos[c]!)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "Este campo es requerido",
                      style: TextStyle(color: Colors.red.shade600, fontSize: 12),
                    ),
                  ),
              ],
            ),
          )),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  if (_validarFormulario()) {
                    Navigator.pop(context, {
                      for (var c in widget.campos) c: controllers[c]!.text
                    });
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text("Guardar"),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context, null),
                icon: const Icon(Icons.close),
                label: const Text("Cancelar"),
              ),
            ],
          )
        ],
      ),
    );
  }
}