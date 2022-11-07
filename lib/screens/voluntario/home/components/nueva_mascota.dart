import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/screens/login/components/login_form.dart';
import 'package:pet_app/utils/color.dart';

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
  final itemColor = ['Color', 'Color2', 'Color3', 'Color4'];
  String _nombre = "";
  String? _tipo;
  String? _vacunado;
  String? _esterilizado;
  String? _raza;
  String? _sexo;
  String? _color;
  String _descripcion = "";
  String _fechaNacimiento = "";
  String _foto = "";
  String _fechaIngreso = "";

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
                    child: Text("Raza"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: DropdownButton<String>(
                      value: _raza,
                      items: itemRaza.map(buildMenuItemTipos).toList(),
                      onChanged: (value) {
                        setState(() {
                          _raza = value!;
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
              TextFieldContainer(
                child: TextField(
                  maxLength: 250,
                  onChanged: (value) {
                    _descripcion = value;
                  },
                  decoration: InputDecoration(
                    icon:
                        Icon(Icons.add_reaction_outlined, color: kPrimaryColor),
                    hintText: "Descripción",
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
                      _raza == "" ||
                      _sexo == "" ||
                      _color == "" ||
                      _descripcion == "" ||
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
                    bool query = await API().insertarMascota(
                      _nombre,
                      _tipo!,
                      _vacunado!,
                      _esterilizado!,
                      _raza!,
                      _sexo!,
                      _color!,
                      _descripcion,
                      _fechaNacimiento,
                      _foto,
                      _fechaIngreso,
                    );
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
