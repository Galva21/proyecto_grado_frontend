import 'package:flutter/material.dart';
import 'package:pet_app/model/mascota.dart';

class UserProvider with ChangeNotifier {
  int _espacioDisponible = -1;
  int _estadoEconomico = -1;
  int _tiempoDisponible = -1;
  List<Mascota> mascotaPredecible = [];

  List<Mascota> get getMascotaPredecible => this.mascotaPredecible;

  set setMascotaPredecible(List<Mascota> mascotaPredecible) {
    this.mascotaPredecible = mascotaPredecible;
    notifyListeners();
  }

  int get espacioDisponible => this._espacioDisponible;

  set espacioDisponible(value) {
    this._espacioDisponible = value;
    notifyListeners();
  }

  int get estadoEconomico => this._estadoEconomico;

  set estadoEconomico(value) {
    this._estadoEconomico = value;
    notifyListeners();
  }

  int get tiempoDisponible => this._tiempoDisponible;

  set tiempoDisponible(value) {
    this._tiempoDisponible = value;
    notifyListeners();
  }
}
