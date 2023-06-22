import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/model/Usuario.dart';
import 'package:pet_app/model/adopcion.dart';
import 'package:pet_app/model/mascota.dart';

class API {
  Future<Usuario> adminLogeado(String id) async {
    var url = Uri.parse(
        "http://192.168.0.20/proyectogrado_api/administrador/administrador.php?id=${id}");
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
        "http://192.168.0.20/proyectogrado_api/voluntario/voluntario.php?id=${id}");
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
        "http://192.168.0.20/proyectogrado_api/mascota/eliminar_mascota.php");
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
        "http://192.168.0.20/proyectogrado_api/voluntario/eliminar_voluntario.php");
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
    var url = Uri.parse(
        "http://192.168.0.20/proyectogrado_api/voluntario/voluntarios.php");
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

  Future<List<Adopcion>> adopcionesFiltradas(String campo) async {
    List<Adopcion> adopciones = [];
    var url = Uri.parse(
        "http://192.168.0.20/proyectogrado_api/adopcion/adopcion.php?campo=${campo}");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final List<dynamic> data = json.decode(response.body);
    for (var e in data) {
      adopciones.add(Adopcion(
          ci_adopt: e['ci_adopt'],
          color: e['color'],
          desparacitado: e['desparacitado'],
          direccion_adopt: e['direccion_adopt'],
          esterilizado: e['esterilizado'],
          fecha_adopcion: e['fecha_adopcion'],
          fecha_ingreso: e['fecha_ingreso'],
          fecha_nacimiento: e['fecha_nacimiento'],
          fecha_salida: e['fecha_salida'],
          foto: e['foto'],
          id_adopcion: e['id_adopcion'],
          id_mascota: e['id_mascota'],
          id_voluntario: e['id_voluntario'],
          long_pelaje: e['long_pelaje'],
          madurez: e['madurez'],
          nombre: e['nombre'],
          nombre_adopt: e['nombre_adopt'],
          sexo: e['sexo'],
          telefono_adopt: e['telefono_adopt'],
          tiempo_adopcion: e['tiempo_adopcion'],
          tipo: e['tipo'],
          vacunado: e['vacunado']));
    }
    return adopciones;
  }

  Future<List<Adopcion>> adopciones() async {
    List<Adopcion> adopciones = [];
    var url = Uri.parse(
        "http://192.168.0.20/proyectogrado_api/adopcion/adopciones.php");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final List<dynamic> data = json.decode(response.body);
    for (var e in data) {
      adopciones.add(Adopcion(
          ci_adopt: e['ci_adopt'],
          color: e['color'],
          desparacitado: e['desparacitado'],
          direccion_adopt: e['direccion_adopt'],
          esterilizado: e['esterilizado'],
          fecha_adopcion: e['fecha_adopcion'],
          fecha_ingreso: e['fecha_ingreso'],
          fecha_nacimiento: e['fecha_nacimiento'],
          fecha_salida: e['fecha_salida'],
          foto: e['foto'],
          id_adopcion: e['id_adopcion'],
          id_mascota: e['id_mascota'],
          id_voluntario: e['id_voluntario'],
          long_pelaje: e['long_pelaje'],
          madurez: e['madurez'],
          nombre: e['nombre'],
          nombre_adopt: e['nombre_adopt'],
          sexo: e['sexo'],
          telefono_adopt: e['telefono_adopt'],
          tiempo_adopcion: e['tiempo_adopcion'],
          tipo: e['tipo'],
          vacunado: e['vacunado']));
    }
    return adopciones;
  }

  Future<List<Mascota>> mascotas() async {
    List<Mascota> mascotas = [];
    var url =
        Uri.parse("http://192.168.0.20/proyectogrado_api/mascota/mascotas.php");
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
        desparacitado: e['desparacitado'],
        madurez: e['madurez'],
        tiempoAdopcion: int.parse(e['tiempo_adopcion']),
        pelaje: e['long_pelaje'],
      ));
    }
    return mascotas;
  }

  Future<List<Mascota>> mascotasNoAdoptadas() async {
    List<Mascota> mascotas = [];
    var url = Uri.parse(
        "http://192.168.0.20/proyectogrado_api/mascota/mascotasNoAdoptadas.php");
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
        desparacitado: e['desparacitado'],
        madurez: e['madurez'],
        tiempoAdopcion: int.parse(e['tiempo_adopcion']),
        pelaje: e['long_pelaje'],
      ));
    }
    return mascotas;
  }

  Future<bool> restablecer_contrasenia(
      String usuario, String respuesta, String contrasenia) async {
    var url = Uri.parse(
        "http://192.168.0.20/proyectogrado_api/login/restablecer.php");
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
        "http://192.168.0.20/proyectogrado_api/login/usuario_existe.php");
    var response = await http.post(url, body: {'usuario': '${usuario}'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['login'].toString());
    return data[0]['login'];
  }

  Future<String> preguntaUsuario(String usuario) async {
    var url = Uri.parse(
        "http://192.168.0.20/proyectogrado_api/login/usuario_existe.php");
    var response = await http.post(url, body: {'usuario': '${usuario}'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['login'].toString());
    return data[0]['pregunta'];
  }

  Future<bool> iniciarSesion(String usuario, String contra) async {
    var url =
        Uri.parse("http://192.168.0.20/proyectogrado_api/login/login.php");
    var response = await http
        .post(url, body: {'usuario': '${usuario}', 'contrasenia': '${contra}'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['login'].toString());
    return data[0]['login'];
  }

  Future<bool> insertarMascota({
    required String nombre,
    required String tipo,
    required String vacunado,
    required String desparacitado,
    required String esterilizado,
    required String sexo,
    required String color,
    required String madurez,
    required String pelaje,
    required String fechaNacimiento,
    required String foto,
    required String fechaIngreso,
    required int tiempoAdopcion,
  }) async {
    var url = Uri.parse(
        "http://192.168.0.20/proyectogrado_api/mascota/nueva_mascota.php");
    var response = await http.post(url, body: {
      'nombre': '${nombre}',
      'tipo': '${tipo}',
      'vacunado': '${vacunado}',
      'desparacitado': '${desparacitado}',
      'esterilizado': '${esterilizado}',
      'sexo': '${sexo}',
      'color': '${color}',
      'madurez': '${madurez}',
      'long_pelaje': '${pelaje}',
      'fecha_nacimiento': '${fechaNacimiento}',
      'foto': '${foto}',
      'fecha_ingreso': '${fechaIngreso}',
      'fecha_salida': '1999-01-01',
      'tiempo_adopcion': '${tiempoAdopcion}',
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
      String respuesta_recuperacion) async {
    var url = Uri.parse(
        "http://192.168.0.20/proyectogrado_api/voluntario/nuevo_voluntario.php");
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

  Future<bool> insertarAdopcion(
      String id_voluntario,
      String id_mascota,
      String nombre_adopt,
      String ci_adopt,
      String telefono_adopt,
      String direccion_adopt,
      String fecha_adopcion) async {
    var url = Uri.parse(
        "http://192.168.0.20/proyectogrado_api/adopcion/nueva_adopcion.php");
    var response = await http.post(url, body: {
      'id_voluntario': '${id_voluntario}',
      'id_mascota': '${id_mascota}',
      'nombre_adopt': '${nombre_adopt}',
      'ci_adopt': '${ci_adopt}',
      'telefono_adopt': '${telefono_adopt}',
      'direccion_adopt': '${direccion_adopt}',
      'fecha_adopcion': '${fecha_adopcion}'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic data = json.decode(response.body);
    print('Response decode body: ' + data[0]['mensaje'].toString());
    return data[0]['salida'];
  }
}
