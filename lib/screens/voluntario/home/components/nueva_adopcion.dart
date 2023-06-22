import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/model/Usuario.dart';
import 'package:pet_app/model/mascota.dart';
import 'package:pet_app/model/voluntario.dart';
import 'package:pet_app/screens/components/alert_dialog.dart';

import 'package:pet_app/screens/login/components/login_form.dart';
import 'package:pet_app/utils/color.dart';

class NuevaAdopcion extends StatefulWidget {
  Mascota mascotaAdop;
  Usuario voluntarioAdop;

  NuevaAdopcion({
    Key? key,
    required this.mascotaAdop,
    required this.voluntarioAdop,
  }) : super(key: key);

  @override
  State<NuevaAdopcion> createState() => _NuevaAdopcionState();
}

class _NuevaAdopcionState extends State<NuevaAdopcion> {
  final _controllerNacimiento = TextEditingController();
  String _fechaNacimiento = "";
  String nombreAdopt = "";
  String ciAdopt = "";
  String telefonoAdopt = "";
  String direccionAdopt = "";
  String fechaAdopt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                height: 50.0,
                alignment: Alignment.center,
                child: const Text(
                  'REGISTRO DE ADOPCIÓN',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kBackgroundColor,
                  boxShadow: [
                    BoxShadow(color: kPrimaryColor, spreadRadius: 1),
                  ],
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  enabled: false,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    icon: Icon(Icons.pets, color: kPrimaryColor),
                    hintText: widget.mascotaAdop.idMascota! +
                        ": " +
                        widget.mascotaAdop.nombre!,
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  enabled: false,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    icon: Icon(Icons.person, color: kPrimaryColor),
                    hintText: widget.voluntarioAdop.id +
                        ": " +
                        widget.voluntarioAdop.nombre +
                        " " +
                        widget.voluntarioAdop.apellidoPaterno +
                        " " +
                        widget.voluntarioAdop.apellidoMaterno,
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  onTap: (() async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1999),
                      lastDate: DateTime(2100),
                    );
                    if (newDate == null) return;
                    String fechaNueva = newDate.year.toString() +
                        "-" +
                        newDate.month.toString() +
                        "-" +
                        newDate.day.toString();
                    String fechaMostrar = newDate.day.toString() +
                        "-" +
                        newDate.month.toString() +
                        "-" +
                        newDate.year.toString();
                    _controllerNacimiento.text = fechaMostrar;
                    _fechaNacimiento = fechaNueva;
                  }),
                  controller: _controllerNacimiento,
                  readOnly: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.date_range,
                      color: kPrimaryColor,
                    ),
                    hintText: "Fecha de adopción",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  onChanged: (value) {
                    nombreAdopt = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.badge, color: kPrimaryColor),
                    hintText: "Nombre adoptante",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  onChanged: (value) {
                    ciAdopt = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.badge, color: kPrimaryColor),
                    hintText: "CI adoptante",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  onChanged: (value) {
                    telefonoAdopt = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.badge, color: kPrimaryColor),
                    hintText: "Telefono adoptante",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  onChanged: (value) {
                    direccionAdopt = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.badge, color: kPrimaryColor),
                    hintText: "Dirección adoptante",
                    border: InputBorder.none,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialogSiNo(
                        mensaje: "¿Seguro desea registrar la adopción?",
                        icono: Icons.crisis_alert,
                        titulo: "Nueva adopción",
                        color: Colors.red,
                        onTap: () async {
                          bool query = await API().insertarAdopcion(
                              widget.voluntarioAdop.id,
                              widget.mascotaAdop.idMascota!,
                              nombreAdopt,
                              ciAdopt,
                              telefonoAdopt,
                              direccionAdopt,
                              _fechaNacimiento);
                          if (query) {
                            Fluttertoast.showToast(
                              msg: "Adopción registrada con exito",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 20,
                            );
                            Navigator.pop(context);
                            Navigator.pop(context);
                          } else {
                            Fluttertoast.showToast(
                              msg:
                                  "Ocurrio un problema al registrar la adopcion",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 20,
                            );
                          }
                        },
                      );
                    },
                  );
                },
                child: Text(
                  "REGISTRAR".toUpperCase(),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
