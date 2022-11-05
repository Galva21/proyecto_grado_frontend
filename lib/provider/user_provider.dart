import 'package:flutter/material.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/model/mascota.dart';

class UserProvider with ChangeNotifier {
  int tipoSeleccionado = 0;
  List<Mascota> mascotas = [];
  List<Mascota> gatos = [];
  List<Mascota> perros = [];

  get getMascotas => this.mascotas;

  setMascotas() async{
    gatos.clear();
    perros.clear();
    mascotas = await API().mascotas();
    for (var e in mascotas) {
      e.tipo == "Gato" ? gatos.add(e) : perros.add(e);
    }
    print("Se actualizo la lista de mascotas");
    notifyListeners();
  }

  int get getTipoSeleccionado => this.tipoSeleccionado;

  set setTipoSeleccionado(int tipoSeleccionado) {
    this.tipoSeleccionado = tipoSeleccionado;
    notifyListeners();
  }
}
