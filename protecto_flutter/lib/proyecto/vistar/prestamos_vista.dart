
import 'package:flutter/material.dart';
import 'package:protecto_flutter/proyecto/barraNavegacion.dart';
import 'package:protecto_flutter/proyecto/formulario.dart';
import 'package:protecto_flutter/proyecto/menu_lateral.dart';
import 'package:protecto_flutter/proyecto/widget_tabla.dart';

class PrestamosVista extends StatefulWidget {
  const PrestamosVista({super.key});

  @override
  State<PrestamosVista> createState() => _PrestamosVistaState();
}

class _PrestamosVistaState extends State<PrestamosVista> {

  List<Map<String, String>> datos = [];
  List<Map<String, String>> filtrados = [];

  int? seleccion;

  final columnas = [
    
    "Nombre del usuario",
    "Titulo del Libro",
    "Fecha de prestamo",
    "Fecha de devolucion",
    
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
    final actionButtonStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(120, 44),
    );

    return Scaffold(
      body: Row(
        children: [

          const MenuLateral(),

          Expanded(
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
                            titulo: "Registrar Préstamo",
                            icono: Icons.assignment_add,
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
                    titulo: "Prestamo",
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: SingleChildScrollView(
                      child: TablaGenerica(
                        columnas: columnas,
                        datos: filtrados,
                        seleccion: seleccion,
                        emptyMessage: "No hay prestamos registrados",
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
                        style: actionButtonStyle,
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
                        style: actionButtonStyle,
                        onPressed: () async {
                          if (seleccion != null) {

                            final editado = await showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                child: FormularioGenerico(
                                  campos: columnas,
                                  inicial: datos[seleccion!],
                                  titulo: "Editar Préstamo",
                                  icono: Icons.edit,
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