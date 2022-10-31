import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/utils/color.dart';

class RestablecerCuentaPage extends StatefulWidget {
  const RestablecerCuentaPage({Key? key, required this.usuario})
      : super(key: key);
  final String usuario;

  @override
  State<RestablecerCuentaPage> createState() => _RestablecerCuentaPageState();
}

class _RestablecerCuentaPageState extends State<RestablecerCuentaPage> {
  String pregunta = "";
  String _respuesta = "";
  String _contrasenia = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recuperarPregunta();
  }

  Future<void> recuperarPregunta() async {
    pregunta = await API().preguntaUsuario(widget.usuario);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                  height: 50.0,
                  alignment: Alignment.center,
                  child: const Text(
                    'RESTABLECER CONTRASEÑA',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColor,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Pregunta de recuperación",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFieldContainer(
                  child: Center(
                    child: Text(
                      pregunta,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldContainer(
                  child: TextField(
                    onChanged: (value) {
                      _respuesta = value;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.add_reaction_outlined,
                        color: kPrimaryColor,
                      ),
                      hintText: "Ingrese la respuesta",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldContainer(
                  child: TextField(
                    onChanged: (value) {
                      _contrasenia = value;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.add_reaction_outlined,
                        color: kPrimaryColor,
                      ),
                      hintText: "Ingrese la nueva contraseña",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_contrasenia == "" || _respuesta == "") {
                      Fluttertoast.showToast(
                        msg: "Complete todos los campos",
                        backgroundColor: Colors.red[700],
                        fontSize: 20,
                        gravity: ToastGravity.TOP,
                        textColor: Colors.white,
                        timeInSecForIosWeb: 2,
                      );
                    } else {
                      bool query = await API().restablecer_contrasenia(
                        widget.usuario,
                        _respuesta,
                        _contrasenia,
                      );
                      if (query) {
                        Fluttertoast.showToast(
                          msg: "Se restableció la contraseña",
                          backgroundColor: Colors.green[700],
                          fontSize: 20,
                          gravity: ToastGravity.TOP,
                          textColor: Colors.white,
                          timeInSecForIosWeb: 2,
                        );
                        Navigator.pop(context);
                      } else {
                        Fluttertoast.showToast(
                          msg: "Respuesta incorrecta",
                          backgroundColor: Colors.red[700],
                          fontSize: 20,
                          gravity: ToastGravity.TOP,
                          textColor: Colors.white,
                          timeInSecForIosWeb: 2,
                        );
                      }
                    }
                  },
                  child: Text(
                    "RESTABLECER".toUpperCase(),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
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
