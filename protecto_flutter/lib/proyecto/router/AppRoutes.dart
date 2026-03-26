import 'package:flutter/material.dart';
import 'package:protecto_flutter/proyecto/vistar/inicio_vista.dart';
import 'package:protecto_flutter/proyecto/vistar/libro_vista.dart';
import 'package:protecto_flutter/proyecto/vistar/prestamos_vista.dart';
import 'package:protecto_flutter/proyecto/vistar/usuario_vista.dart';
import 'package:protecto_flutter/proyecto/vistar/reportes_vista.dart';


class Approutes {
  static const inicio='/inicio';
  static const usuario='/usuario';
  static const libros='/libros';
  static const prestamos='/prestamos';
  static const reportes='/reportes';

static Map<String, WidgetBuilder> getRoutes(){
  return{
    inicio:(context)=> const InicioVista(),
    usuario:(context)=> const UsuarioVista(),
    libros:(context)=> const LibroVista(),
    prestamos:(context)=> const PrestamosVista(),
    reportes:(context)=> const ReportesVista(),
  };

}




}