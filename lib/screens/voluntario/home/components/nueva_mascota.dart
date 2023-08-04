import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/database/mlapi.dart';
import 'package:pet_app/screens/login/components/login_form.dart';
import 'package:pet_app/services/upload_file.dart';
import 'package:pet_app/utils/color.dart';
import 'package:time_machine/time_machine.dart';

class NuevaMascotaPage extends StatefulWidget {
  const NuevaMascotaPage({Key? key}) : super(key: key);

  @override
  State<NuevaMascotaPage> createState() => _NuevaMascotaPageState();
}

class _NuevaMascotaPageState extends State<NuevaMascotaPage> {
  DropdownMenuItem<String> buildMenuItemTipos(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  final _controllerNacimiento = TextEditingController();
  final _controllerIngreso = TextEditingController();
  final itemsTipos = ['Perro', 'Gato'];
  final itemsSiNo = ['Si', 'No'];
  final itemRaza = ['Raza1', 'Raza2', 'Raza3', 'Raza4'];
  final itemSexo = ['Macho', 'Hembra'];
  final itemColor = [
    'Negro',
    'Marron',
    'Dorado',
    'Amarillo',
    'Manchas',
    'Gris',
    'Blanco'
  ];
  final itemMadurez = ['Pequeño', 'Mediano', 'Grande'];
  final itemPelaje = ['Corto', 'Mediano', 'Largo'];
  String _nombre = "";
  String? _tipo;
  String? _vacunado;
  String? _esterilizado;
  String? _desparacitado;
  String _raza = "";
  String? _sexo;
  String? _color;
  String? _madurez;
  String? _pelaje;
  String _descripcion = "";
  String _fechaNacimiento = "";
  String _foto = "";
  String _fechaIngreso = "";

  String imagePath = "";
  XFile? _file_picker;

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
                  'REGISTRO DE MASCOTA',
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
              Container(
                height: 75,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Icon(Icons.create_new_folder_rounded, size: 30),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: CircleBorder(),
                          elevation: 5,
                          minimumSize: Size(50, 50)),
                      onPressed: () async {
                        try {
                          final ImagePicker _picker = ImagePicker();
                          _file_picker = await _picker.pickImage(
                              source: ImageSource.gallery);
                          imagePath = _file_picker!.path;
                          print(_file_picker!.path);
                        } catch (e) {
                          print(e.toString());
                        }
                        setState(() {});
                      },
                    ),
                    ElevatedButton(
                      child: Icon(Icons.camera_alt, size: 30),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: CircleBorder(),
                          elevation: 5,
                          minimumSize: Size(50, 50)),
                      onPressed: () async {
                        try {
                          final ImagePicker _picker = ImagePicker();
                          _file_picker = await _picker.pickImage(
                              source: ImageSource.camera);
                          imagePath = _file_picker!.path;
                          print(_file_picker!.path);
                        } catch (e) {
                          print(e.toString());
                        }
                        setState(() {});
                      },
                    ),
                    imagePath == ""
                        ? Container()
                        : Container(
                            child: Image.file(
                              File(imagePath),
                            ),
                          )
                  ],
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  onChanged: (value) {
                    _nombre = value;
                  },
                  decoration: InputDecoration(
                    icon:
                        Icon(Icons.add_reaction_outlined, color: kPrimaryColor),
                    hintText: "Nombre",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text("Tipo de mascota"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: DropdownButton<String>(
                      value: _tipo,
                      items: itemsTipos.map(buildMenuItemTipos).toList(),
                      onChanged: (value) {
                        setState(() {
                          _tipo = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text("Vacunado"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: DropdownButton<String>(
                      value: _vacunado,
                      items: itemsSiNo.map(buildMenuItemTipos).toList(),
                      onChanged: (value) {
                        setState(() {
                          _vacunado = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text("Desparacitado"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: DropdownButton<String>(
                      value: _desparacitado,
                      items: itemsSiNo.map(buildMenuItemTipos).toList(),
                      onChanged: (value) {
                        setState(() {
                          _desparacitado = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text("Esterilizado"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: DropdownButton<String>(
                      value: _esterilizado,
                      items: itemsSiNo.map(buildMenuItemTipos).toList(),
                      onChanged: (value) {
                        setState(() {
                          _esterilizado = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text("Sexo"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: DropdownButton<String>(
                      value: _sexo,
                      items: itemSexo.map(buildMenuItemTipos).toList(),
                      onChanged: (value) {
                        setState(() {
                          _sexo = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text("Color"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: DropdownButton<String>(
                      value: _color,
                      items: itemColor.map(buildMenuItemTipos).toList(),
                      onChanged: (value) {
                        setState(() {
                          _color = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text("Tamaño de madurez"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: DropdownButton<String>(
                      value: _madurez,
                      items: itemMadurez.map(buildMenuItemTipos).toList(),
                      onChanged: (value) {
                        setState(() {
                          _madurez = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text("Longitud de pelaje"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: DropdownButton<String>(
                      value: _pelaje,
                      items: itemPelaje.map(buildMenuItemTipos).toList(),
                      onChanged: (value) {
                        setState(() {
                          _pelaje = value!;
                        });
                      },
                    ),
                  ),
                ],
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
                      Icons.add_reaction_outlined,
                      color: kPrimaryColor,
                    ),
                    hintText: "Fecha de nacimiento",
                    border: InputBorder.none,
                  ),
                ),
              ),
              RoundedInputField(
                hint: "URL foto",
                icon: Icons.add_reaction_outlined,
                onChanged: (value) {
                  _foto = value;
                },
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
                    _controllerIngreso.text = fechaMostrar;
                    _fechaIngreso = fechaNueva;
                  }),
                  controller: _controllerIngreso,
                  readOnly: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.add_reaction_outlined,
                      color: kPrimaryColor,
                    ),
                    hintText: "Fecha de ingreso",
                    border: InputBorder.none,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_nombre == "" ||
                      _tipo == "" ||
                      _vacunado == "" ||
                      _esterilizado == "" ||
                      _desparacitado == "" ||
                      _sexo == "" ||
                      _color == "" ||
                      _pelaje == "" ||
                      _fechaNacimiento == "" ||
                      _foto == "" ||
                      _fechaIngreso == "") {
                    Fluttertoast.showToast(
                      msg: "Complete todos los campos",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 20,
                    );
                  } else {
                    int tipoP = 0;
                    int sexoP = 0;
                    int colorP = 0;
                    int madurezP = 0;
                    int vacunadoP = 0;
                    int desparacitadoP = 0;
                    int esterilizadoP = 0;
                    int cantidadMeses = 0;

                    LocalDateTime a = LocalDateTime.now();
                    LocalDateTime b =
                        LocalDateTime.dateTime(DateTime.parse("2022-06-01"));
                    Period diff = a.periodSince(b);
                    cantidadMeses = diff.months;

                    switch (_esterilizado) {
                      case "Si":
                        esterilizadoP = 1;
                        break;
                      case "No":
                        esterilizadoP = 2;
                        break;
                    }
                    switch (_desparacitado) {
                      case "Si":
                        desparacitadoP = 1;
                        break;
                      case "No":
                        desparacitadoP = 2;
                        break;
                    }
                    switch (_vacunado) {
                      case "Si":
                        vacunadoP = 1;
                        break;
                      case "No":
                        vacunadoP = 2;
                        break;
                    }
                    switch (_madurez) {
                      case "Pequeño":
                        madurezP = 1;
                        break;
                      case "Mediano":
                        madurezP = 2;
                        break;
                      case "Grande":
                        madurezP = 3;
                        break;
                      case "Muy grande":
                        madurezP = 4;
                        break;
                    }
                    switch (_tipo) {
                      case "Perro":
                        tipoP = 1;
                        break;
                      case "Gato":
                        tipoP = 2;
                        break;
                    }
                    switch (_sexo) {
                      case "Macho":
                        sexoP = 1;
                        break;
                      case "Hembra":
                        sexoP = 2;
                        break;
                    }
                    switch (_color) {
                      case "Negro":
                        colorP = 1;
                        break;
                      case "Marron":
                        colorP = 2;
                        break;
                      case "Dorado":
                        colorP = 3;
                        break;
                      case "Amarillo":
                        colorP = 4;
                        break;
                      case "Manchas":
                        colorP = 5;
                        break;
                      case "Gris":
                        colorP = 6;
                        break;
                      case "Blanco":
                        colorP = 7;
                        break;
                    }
                    int tiempoAdopcion = await MLapi().getPrediccion(
                      color: colorP,
                      desparacitado: desparacitadoP,
                      edad: cantidadMeses,
                      esterilizado: esterilizadoP,
                      madurez: madurezP,
                      sexo: sexoP,
                      tipo: tipoP,
                      vacunado: vacunadoP,
                    );

                    bool query = await API().insertarMascota(
                      nombre: _nombre,
                      tipo: _tipo!,
                      vacunado: _vacunado!,
                      desparacitado: _desparacitado!,
                      esterilizado: _esterilizado!,
                      sexo: _sexo!,
                      color: _color!,
                      madurez: _madurez!,
                      pelaje: _pelaje!,
                      fechaNacimiento: _fechaNacimiento,
                      foto: _foto,
                      fechaIngreso: _fechaIngreso,
                      tiempoAdopcion: tiempoAdopcion,
                    );

                    try {
                      final uploaded = await uploadFile(_file_picker!);
                      if (!uploaded) {
                        Fluttertoast.showToast(
                        msg: "Error al subir la imagen",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20,
                      );
                      }
                    } catch (e) {
                      print(e);
                      Fluttertoast.showToast(
                        msg: "Debe seleccionar una imagen",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.orange,
                        textColor: Colors.white,
                        fontSize: 20,
                      );
                    }

                    if (query) {
                      Fluttertoast.showToast(
                        msg: "Mascota registrada con exito",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 20,
                      );
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(
                        msg: "Ocurrio un problema al registrar a la mascota",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20,
                      );
                    }
                  }
                },
                child: Text(
                  "REGISTRAR".toUpperCase(),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(icon, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
