import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pet_app/screens/voluntario/home/components/nueva_mascota.dart';
import 'package:pet_app/utils/color.dart';

class PrediccionMascotas extends StatefulWidget {
  const PrediccionMascotas({Key? key}) : super(key: key);

  @override
  State<PrediccionMascotas> createState() => _PrediccionMascotasState();
}

class _PrediccionMascotasState extends State<PrediccionMascotas> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Prediccion de la red neuronal"),),);
  }
}