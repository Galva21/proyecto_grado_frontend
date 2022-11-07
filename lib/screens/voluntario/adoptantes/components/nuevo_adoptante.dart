import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/utils/color.dart';

class NuevoAdoptante extends StatefulWidget {
  const NuevoAdoptante({Key? key}) : super(key: key);

  @override
  State<NuevoAdoptante> createState() => _NuevoAdoptanteState();
}

class _NuevoAdoptanteState extends State<NuevoAdoptante> {
  DropdownMenuItem<String> buildMenuItemTipos(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
  String _nombre = "";
  String _ci = "";
  String _paterno = "";
  String _materno = "";
  String _telefono = "";
  String _email = "";
  String? _sexo;
  String _direccion = "";
  String _fechaNacimiento = "";
  String _foto = "";
  final _controllerNacimiento = TextEditingController();
  final itemsSexo = ['Hombre', 'Mujer'];

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
                  'REGISTRO DE ADOPTANTE',
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
              TextFieldContainerN(
                child: TextField(
                  onChanged: (value) {
                    _ci = value;
                  },
                  decoration: InputDecoration(
                    icon:
                        Icon(Icons.add_reaction_outlined, color: kPrimaryColor),
                    hintText: "CI",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainerN(
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
              TextFieldContainerN(
                child: TextField(
                  onChanged: (value) {
                    _paterno = value;
                  },
                  decoration: InputDecoration(
                    icon:
                        Icon(Icons.add_reaction_outlined, color: kPrimaryColor),
                    hintText: "Apellido paterno",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainerN(
                child: TextField(
                  onChanged: (value) {
                    _materno = value;
                  },
                  decoration: InputDecoration(
                    icon:
                        Icon(Icons.add_reaction_outlined, color: kPrimaryColor),
                    hintText: "Apellido materno",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainerN(
                child: TextField(
                  onChanged: (value) {
                    _telefono = value;
                  },
                  decoration: InputDecoration(
                    icon:
                        Icon(Icons.add_reaction_outlined, color: kPrimaryColor),
                    hintText: "Telefono",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainerN(
                child: TextField(
                  onChanged: (value) {
                    _email = value;
                  },
                  decoration: InputDecoration(
                    icon:
                        Icon(Icons.add_reaction_outlined, color: kPrimaryColor),
                    hintText: "Email",
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
                      items: itemsSexo.map(buildMenuItemTipos).toList(),
                      onChanged: (value) {
                        setState(() {
                          _sexo = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextFieldContainerN(
                child: TextField(
                  onChanged: (value) {
                    _direccion = value;
                  },
                  decoration: InputDecoration(
                    icon:
                        Icon(Icons.add_reaction_outlined, color: kPrimaryColor),
                    hintText: "Direccion",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainerN(
                child: TextField(
                  onTap: (() async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2023),
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
              ElevatedButton(
                onPressed: () async {
                  if (_ci == "" ||
                      _nombre == "" ||
                      _paterno == "" ||
                      _materno == "" ||
                      _telefono == "" ||
                      _email == "" ||
                      _sexo == "" ||
                      _direccion == "" ||
                      _fechaNacimiento == "" ||
                      _foto == "") {
                    Fluttertoast.showToast(
                      msg: "Complete todos los campos",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 20,
                    );
                  } else {
                    bool query = await API().insertarAdoptante(
                        _ci,
                        _nombre,
                        _paterno,
                        _materno,
                        _telefono,
                        _email,
                        _sexo!,
                        _direccion,
                        _fechaNacimiento,
                        _foto);
                    if (query) {
                      Fluttertoast.showToast(
                        msg: "Adoptante registrado con exito",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 20,
                      );
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(
                        msg: "Ocurrio un problema al registrar al adoptante",
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
    return TextFieldContainerN(
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

class TextFieldContainerN extends StatelessWidget {
  final Widget child;

  const TextFieldContainerN({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
