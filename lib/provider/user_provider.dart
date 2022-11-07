import 'package:flutter/material.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/model/Usuario.dart';
import 'package:pet_app/model/adoptante.dart';
import 'package:pet_app/model/mascota.dart';

class UserProvider with ChangeNotifier {
  int tipoSeleccionado = 0;
  Usuario usuarioLogeado = Usuario(
      id: "",
      ci: "",
      nombre: "",
      apellidoPaterno: "",
      apellidoMaterno: "",
      telefono: "",
      email: "",
      sexo: "",
      direccion: "",
      fechaNacimiento: "",
      foto: "",
      contrasenia: "",
      preguntaRecuperacion: "",
      respuestaRecuperacion: "");
  List<Mascota> mascotas = [];
  List<Usuario> voluntarios = [];
  List<Adoptante> adoptantes = [];
  List<Mascota> gatos = [];
  List<Mascota> perros = [];

  setUsuarioLogeado(String id) async {
    usuarioLogeado = await API().voluntarioLogeado(id);
    print("Usuario logeado");
    notifyListeners();
  }

  setAdminLogeado(String id) async {
    usuarioLogeado = await API().adminLogeado(id);
    print("Admin logeado");
    notifyListeners();
  }

  setMascotas() async {
    gatos.clear();
    perros.clear();
    mascotas = await API().mascotas();
    for (var e in mascotas) {
      e.tipo == "Gato" ? gatos.add(e) : perros.add(e);
    }
    print("Se actualizo la lista de mascotas");
    notifyListeners();
  }

  setVoluntarios() async {
    voluntarios = await API().voluntarios();
    print("Se actualizo la lista de voluntarios");
    notifyListeners();
  }

  setAdoptantes() async {
    adoptantes = await API().adoptantes();
    print("Se actualizo la lista de adoptantes");
    notifyListeners();
  }

  set setTipoSeleccionado(int tipoSeleccionado) {
    this.tipoSeleccionado = tipoSeleccionado;
    notifyListeners();
  }
}
