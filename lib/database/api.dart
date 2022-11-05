import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/model/mascota.dart';

class API {
  Future<bool> eliminar_mascota(String id) async {
    var url = Uri.parse(
        "http://192.168.0.17/proyectogrado_api/mascota/eliminar_mascota.php");
    var response = await http.post(url, body: {
      'id': '${id}',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['mensaje'].toString());
    return data[0]['salida'];
  }

  Future<List<Mascota>> mascotas() async {
    List<Mascota> mascotas = [];
    var url =
        Uri.parse("http://192.168.0.17/proyectogrado_api/mascota/mascotas.php");
    var response = await http.post(url, body: {});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final List<dynamic> data = json.decode(response.body);
    for (var e in data) {
      mascotas.add(Mascota(
        idMascota: e['id_mascota'],
        color: e['color'],
        descripcion: e['descripcion'],
        esterilizado: e['esterilizado'],
        fechaIngreso: e['fecha_ingreso'],
        fechaNacimiento: e['fecha_nacimiento'],
        fechaSalida: e['fecha_salida'],
        foto: e['foto'],
        nombre: e['nombre'],
        raza: e['raza'],
        sexo: e['sexo'],
        tipo: e['tipo'],
        vacunado: e['vacunado'],
      ));
    }
    return mascotas;
  }

  Future<bool> restablecer_contrasenia(
      String usuario, String respuesta, String contrasenia) async {
    var url = Uri.parse(
        "http://192.168.0.17/proyectogrado_api/login/restablecer.php");
    var response = await http.post(url, body: {
      'usuario': '${usuario}',
      'respuesta': '${respuesta}',
      'contrasenia': '${contrasenia}'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['login'].toString());
    return data[0]['salida'];
  }

  Future<bool> existeUsuario(String usuario) async {
    var url = Uri.parse(
        "http://192.168.0.17/proyectogrado_api/login/usuario_existe.php");
    var response = await http.post(url, body: {'usuario': '${usuario}'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['login'].toString());
    return data[0]['login'];
  }

  Future<String> preguntaUsuario(String usuario) async {
    var url = Uri.parse(
        "http://192.168.0.17/proyectogrado_api/login/usuario_existe.php");
    var response = await http.post(url, body: {'usuario': '${usuario}'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['login'].toString());
    return data[0]['pregunta'];
  }

  Future<bool> iniciarSesion(String usuario, String contra) async {
    var url =
        Uri.parse("http://192.168.0.17/proyectogrado_api/login/login.php");
    var response = await http
        .post(url, body: {'usuario': '${usuario}', 'contrasenia': '${contra}'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['login'].toString());
    return data[0]['login'];
  }

  Future<bool> insertarMascota(
    String nombre,
    String tipo,
    String vacunado,
    String esterilizado,
    String raza,
    String sexo,
    String color,
    String descripcion,
    String fechaNacimiento,
    String foto,
    String fechaIngreso,
  ) async {
    var url = Uri.parse(
        "http://192.168.0.17/proyectogrado_api/mascota/nueva_mascota.php");
    var response = await http.post(url, body: {
      'nombre': '${nombre}',
      'tipo': '${tipo}',
      'vacunado': '${vacunado}',
      'esterilizado': '${esterilizado}',
      'raza': '${raza}',
      'sexo': '${sexo}',
      'color': '${color}',
      'descripcion': '${descripcion}',
      'fecha_nacimiento': '${fechaNacimiento}',
      'foto': '${foto}',
      'fecha_ingreso': '${fechaIngreso}',
      'fecha_salida': '1999-01-01'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['mensaje'].toString());
    return data[0]['salida'];
  }
}
