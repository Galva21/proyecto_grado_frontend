import 'package:flutter/material.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/model/Usuario.dart';
import 'package:pet_app/model/adoptante.dart';
import 'package:pet_app/model/mascota.dart';

class UserProvider with ChangeNotifier {
  int tipoSeleccionado = 0;
  int prediccionSeleccionado = 0;
  String idMascotaAdopcion = "";
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
  List<Mascota> mascotasNoAdoptadas = [];
  List<Usuario> voluntarios = [];
  List<Adoptante> adoptantes = [];
  List<Mascota> gatos = [];
  List<Mascota> perros = [];
  List<Mascota> prediccion1 = [];
  List<Mascota> prediccion2 = [];
  List<Mascota> prediccion3 = [];
  List<Mascota> prediccion4 = [];

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
    mascotasNoAdoptadas = await API().mascotasNoAdoptadas();
    for (var e in mascotasNoAdoptadas) {
      e.tipo == "Gato" ? gatos.add(e) : perros.add(e);
      switch (e.tiempoAdopcion) {
        case 1:
          prediccion1.add(e);
          break;
        case 2:
          prediccion2.add(e);
          break;
        case 3:
          prediccion3.add(e);
          break;
        case 4:
          prediccion4.add(e);
          break;
      }
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

  set setPrediccionSeleccionado(int tipoSeleccionado) {
    this.prediccionSeleccionado = tipoSeleccionado;
    notifyListeners();
  }
}
