import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  int _tamaniogrande = -1;
  int _espacioDisponible = -1;
  int _estadoEconomico = -1;
  int _tiempoDisponible = -1;

  int get tamaniogrande => this._tamaniogrande;

  set tamaniogrande(int value) {
    this._tamaniogrande = value;
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
