import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pet_app/screens/voluntario/home/components/nueva_mascota.dart';
import 'package:pet_app/utils/color.dart';

class MascotasPage extends StatefulWidget {
  const MascotasPage({Key? key}) : super(key: key);

  @override
  State<MascotasPage> createState() => _MascotasPageState();
}

class _MascotasPageState extends State<MascotasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Text("ESTIMACION DE ADOPCION DE MASCOTAS"),
        ),
      ),
    );
  }
}
