import 'package:flutter/material.dart';
class Mascota {
  String? idMascota;
  String? nombre;
  String? tipo;
  String? vacunado;
  String? esterilizado;
  String? raza;
  String? sexo;
  String? color;
  String? descripcion;
  String? fechaNacimiento;
  String? foto;
  String? fechaIngreso;
  String? fechaSalida;

  Mascota(
      {this.idMascota,
      this.nombre,
      this.tipo,
      this.vacunado,
      this.esterilizado,
      this.raza,
      this.sexo,
      this.color,
      this.descripcion,
      this.fechaNacimiento,
      this.foto,
      this.fechaIngreso,
      this.fechaSalida});

  Mascota.fromJson(Map<String, dynamic> json) {
    idMascota = json['id_mascota'];
    nombre = json['nombre'];
    tipo = json['tipo'];
    vacunado = json['vacunado'];
    esterilizado = json['esterilizado'];
    raza = json['raza'];
    sexo = json['sexo'];
    color = json['color'];
    descripcion = json['descripcion'];
    fechaNacimiento = json['fecha_nacimiento'];
    foto = json['foto'];
    fechaIngreso = json['fecha_ingreso'];
    fechaSalida = json['fecha_salida'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_mascota'] = this.idMascota;
    data['nombre'] = this.nombre;
    data['tipo'] = this.tipo;
    data['vacunado'] = this.vacunado;
    data['esterilizado'] = this.esterilizado;
    data['raza'] = this.raza;
    data['sexo'] = this.sexo;
    data['color'] = this.color;
    data['descripcion'] = this.descripcion;
    data['fecha_nacimiento'] = this.fechaNacimiento;
    data['foto'] = this.foto;
    data['fecha_ingreso'] = this.fechaIngreso;
    data['fecha_salida'] = this.fechaSalida;
    return data;
  }
}