class Usuario {
  String id;
  String ci;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  String telefono;
  String email;
  String sexo;
  String direccion;
  String fechaNacimiento;
  String foto;
  String contrasenia;
  String preguntaRecuperacion;
  String respuestaRecuperacion;

  Usuario(
      {required this.id,
      required this.ci,
      required this.nombre,
      required this.apellidoPaterno,
      required this.apellidoMaterno,
      required this.telefono,
      required this.email,
      required this.sexo,
      required this.direccion,
      required this.fechaNacimiento,
      required this.foto,
      required this.contrasenia,
      required this.preguntaRecuperacion,
      required this.respuestaRecuperacion});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_administrador'] = this.id;
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