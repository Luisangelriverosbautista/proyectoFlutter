import 'package:flutter/material.dart';
import 'package:protecto_flutter/proyecto/barraNavegacion.dart';
import 'package:protecto_flutter/proyecto/formulario.dart';
import 'package:protecto_flutter/proyecto/menu_lateral.dart';
import 'package:protecto_flutter/proyecto/widget_tabla.dart';

class UsuarioVista extends StatefulWidget {
  const UsuarioVista({super.key});

  @override
  State<UsuarioVista> createState() => _UsuarioVistaState();
}

class _UsuarioVistaState extends State<UsuarioVista> {

  List<Map<String, String>> datos = [];
  List<Map<String, String>> filtrados = [];

  int? seleccion;

  final columnas = [
    
    "Nombre",
    "Apellido",
    "Correo",
    "Telefono",
    "Direccion"
  ];

  final buscador = TextEditingController();

  @override
  void initState() {
    super.initState();
    filtrados = datos;
  }

  void buscar() {
    setState(() {
      filtrados = datos.where((item) {
        return item.values.any((v) =>
            v.toLowerCase().contains(
                buscador.text.toLowerCase()));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [

          const Expanded(flex: 1, child: MenuLateral()),

          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  BarraSuperior(
                    controller: buscador,
                    onBuscar: buscar,
                    onAgregar: () async {
                      final nuevo = await showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          child: FormularioGenerico(
                            campos: columnas,
                          ),
                        ),
                      );

                      if (nuevo != null) {
                        setState(() {
                          datos.add(nuevo);
                          filtrados = datos;
                        });
                      }
                    },
                    titulo: "Usuario",
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: SingleChildScrollView(
                      child: TablaGenerica(
                        columnas: columnas,
                        datos: filtrados,
                        seleccion: seleccion,
                        onSeleccion: (i) {
                          setState(() => seleccion = i);
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // ELIMINAR
                      ElevatedButton(
                        onPressed: () {
                          if (seleccion != null) {
                            setState(() {
                              datos.removeAt(seleccion!);
                              filtrados = datos;
                              seleccion = null;
                            });
                          }
                        },
                        child: const Text("Eliminar"),
                      ),

                      const SizedBox(width: 20),

                      // EDITAR
                      ElevatedButton(
                        onPressed: () async {
                          if (seleccion != null) {

                            final editado = await showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                child: FormularioGenerico(
                                  campos: columnas,
                                  inicial: datos[seleccion!],
                                ),
                              ),
                            );

                            if (editado != null) {
                              setState(() {
                                datos[seleccion!] = editado;
                                filtrados = datos;
                              });
                            }
                          }
                        },
                        child: const Text("Editar"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}