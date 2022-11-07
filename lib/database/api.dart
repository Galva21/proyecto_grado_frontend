import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/model/Usuario.dart';
import 'package:pet_app/model/adoptante.dart';
import 'package:pet_app/model/mascota.dart';

class API {

  Future<Usuario> adminLogeado(String id) async {
    var url = Uri.parse(
        "http://192.168.0.17/proyectogrado_api/administrador/administrador.php?id=${id}");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    Usuario usuarioLogeado = Usuario(
      id: data[0]['id_administrador'],
      apellidoMaterno: data[0]['apellido_materno'],
      apellidoPaterno: data[0]['apellido_paterno'],
      telefono: data[0]['telefono'],
      ci: data[0]['ci'],
      contrasenia: data[0]['contrasenia'],
      direccion: data[0]['direccion'],
      email: data[0]['email'],
      fechaNacimiento: data[0]['fecha_nacimiento'],
      foto: data[0]['foto'],
      nombre: data[0]['nombre'],
      preguntaRecuperacion: data[0]['pregunta_recuperacion'],
      respuestaRecuperacion: data[0]['respuesta_recuperacion'],
      sexo: data[0]['sexo'],
    );
    return usuarioLogeado;
  }

  Future<Usuario> voluntarioLogeado(String id) async {
    var url = Uri.parse(
        "http://192.168.0.17/proyectogrado_api/voluntario/voluntario.php?id=${id}");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    Usuario usuarioLogeado = Usuario(
      id: data[0]['id_voluntario'],
      apellidoMaterno: data[0]['apellido_materno'],
      apellidoPaterno: data[0]['apellido_paterno'],
      telefono: data[0]['telefono'],
      ci: data[0]['ci'],
      contrasenia: data[0]['contrasenia'],
      direccion: data[0]['direccion'],
      email: data[0]['email'],
      fechaNacimiento: data[0]['fecha_nacimiento'],
      foto: data[0]['foto'],
      nombre: data[0]['nombre'],
      preguntaRecuperacion: data[0]['pregunta_recuperacion'],
      respuestaRecuperacion: data[0]['respuesta_recuperacion'],
      sexo: data[0]['sexo'],
    );
    return usuarioLogeado;
  }

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

  Future<bool> eliminar_voluntario(String id) async {
    var url = Uri.parse(
        "http://192.168.0.17/proyectogrado_api/voluntario/eliminar_voluntario.php");
    var response = await http.post(url, body: {
      'id': '${id}',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['mensaje'].toString());
    return data[0]['salida'];
  }

  Future<bool> eliminar_adoptante(String id) async {
    var url = Uri.parse(
        "http://192.168.0.17/proyectogrado_api/adoptante/eliminar_adoptante.php");
    var response = await http.post(url, body: {
      'id': '${id}',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['mensaje'].toString());
    return data[0]['salida'];
  }

  Future<List<Usuario>> voluntarios() async {
    List<Usuario> voluntarios = [];
    var url =
        Uri.parse("http://192.168.0.17/proyectogrado_api/voluntario/voluntarios.php");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final List<dynamic> data = json.decode(response.body);
    for (var e in data) {
      voluntarios.add(Usuario(
        id: e['id_voluntario'],
        apellidoMaterno: e['apellido_materno'],
        apellidoPaterno: e['apellido_paterno'],
        ci: e['ci'],
        contrasenia: e['contrasenia'],
        direccion: e['direccion'],
        email: e['email'],
        fechaNacimiento: e['fecha_nacimiento'],
        foto: e['foto'],
        nombre: e['nombre'],
        preguntaRecuperacion: e['pregunta_recuperacion'],
        respuestaRecuperacion: e['respuesta_recuperacion'],
        sexo: e['sexo'],
        telefono: e['telefono'],
      ));
    }
    return voluntarios;
  }

  Future<List<Adoptante>> adoptantes() async {
    List<Adoptante> adoptantes = [];
    var url =
        Uri.parse("http://192.168.0.17/proyectogrado_api/adoptante/adoptantes.php");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final List<dynamic> data = json.decode(response.body);
    for (var e in data) {
      adoptantes.add(Adoptante(
        id: e['id_adoptante'],
        apellidoMaterno: e['apellido_materno'],
        apellidoPaterno: e['apellido_paterno'],
        ci: e['ci'],
        direccion: e['direccion'],
        email: e['email'],
        fechaNacimiento: e['fecha_nacimiento'],
        nombre: e['nombre'],
        sexo: e['sexo'],
        telefono: e['telefono'],
        foto: e['foto'],
      ));
    }
    return adoptantes;
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

  Future<bool> insertarVoluntario(
    String ci,
    String nombre,
    String apellido_paterno,
    String apellido_materno,
    String telefono,
    String email,
    String sexo,
    String direccion,
    String fecha_nacimiento,
    String foto,
    String contrasenia,
    String pregunta_recuperacion,
    String respuesta_recuperacion
  ) async {
    var url = Uri.parse(
        "http://192.168.0.17/proyectogrado_api/voluntario/nuevo_voluntario.php");
    var response = await http.post(url, body: {
      'ci': '${ci}',
      'nombre': '${nombre}',
      'paterno': '${apellido_paterno}',
      'materno': '${apellido_materno}',
      'telefono': '${telefono}',
      'email': '${email}',
      'sexo': '${sexo}',
      'direccion': '${direccion}',
      'fecha_nacimiento': '${fecha_nacimiento}',
      'foto': '${foto}',
      'contrasenia': '${contrasenia}',
      'pregunta': '${pregunta_recuperacion}',
      'respuesta': '${respuesta_recuperacion}'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['mensaje'].toString());
    return data[0]['salida'];
  }

  Future<bool> insertarAdoptante(
    String ci,
    String nombre,
    String apellido_paterno,
    String apellido_materno,
    String telefono,
    String email,
    String sexo,
    String direccion,
    String fecha_nacimiento,
    String foto,
  ) async {
    var url = Uri.parse(
        "http://192.168.0.17/proyectogrado_api/adoptante/nuevo_adoptante.php");
    var response = await http.post(url, body: {
      'ci': '${ci}',
      'nombre': '${nombre}',
      'paterno': '${apellido_paterno}',
      'materno': '${apellido_materno}',
      'telefono': '${telefono}',
      'email': '${email}',
      'sexo': '${sexo}',
      'direccion': '${direccion}',
      'fecha_nacimiento': '${fecha_nacimiento}',
      'foto': '${foto}',
      'foto_factura': '',
      'foto_carnet': '',
      'foto_croquis': '',
      'autoridad_hogar': '',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['mensaje'].toString());
    return data[0]['salida'];
  }
}
