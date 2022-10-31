class Voluntario {
  String? id;
  String? ci;
  String? nombre;
  String? apellidoPaterno;
  String? apellidoMaterno;
  String? telefono;
  String? email;
  String? sexo;
  String? direccion;
  String? fechaNacimiento;
  String? foto;
  String? contrasenia;
  String? preguntaRecuperacion;
  String? respuestaRecuperacion;

  Voluntario(
      {this.id,
      this.ci,
      this.nombre,
      this.apellidoPaterno,
      this.apellidoMaterno,
      this.telefono,
      this.email,
      this.sexo,
      this.direccion,
      this.fechaNacimiento,
      this.foto,
      this.contrasenia,
      this.preguntaRecuperacion,
      this.respuestaRecuperacion});

  Voluntario.fromJson(Map<String, dynamic> json) {
    id = json['id_voluntario'];
    ci = json['ci'];
    nombre = json['nombre'];
    apellidoPaterno = json['apellido_paterno'];
    apellidoMaterno = json['apellido_materno'];
    telefono = json['telefono'];
    email = json['email'];
    sexo = json['sexo'];
    direccion = json['direccion'];
    fechaNacimiento = json['fecha_nacimiento'];
    foto = json['foto'];
    contrasenia = json['contrasenia'];
    preguntaRecuperacion = json['pregunta_recuperacion'];
    respuestaRecuperacion = json['respuesta_recuperacion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_voluntario'] = this.id;
    data['ci'] = this.ci;
    data['nombre'] = this.nombre;
    data['apellido_paterno'] = this.apellidoPaterno;
    data['apellido_materno'] = this.apellidoMaterno;
    data['telefono'] = this.telefono;
    data['email'] = this.email;
    data['sexo'] = this.sexo;
    data['direccion'] = this.direccion;
    data['fecha_nacimiento'] = this.fechaNacimiento;
    data['foto'] = this.foto;
    data['contrasenia'] = this.contrasenia;
    data['pregunta_recuperacion'] = this.preguntaRecuperacion;
    data['respuesta_recuperacion'] = this.respuestaRecuperacion;
    return data;
  }
}