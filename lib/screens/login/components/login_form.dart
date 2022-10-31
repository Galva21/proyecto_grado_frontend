import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:pet_app/database/api.dart';
import 'package:pet_app/screens/login/restablecer_cuenta.dart';
import 'package:pet_app/screens/voluntario/root_voluntario.dart';
import 'package:pet_app/utils/color.dart';
import 'package:pet_app/utils/constant.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final controllerUsuario = TextEditingController();

  bool ocultarPass = true;

  @override
  Widget build(BuildContext context) {
    String _valueUsuario = "";
    String _valueContra = "";
    return Form(
      child: Column(
        children: [
          RoundedInputField(
            controller: controllerUsuario,
            hint: "Usuario",
            icon: Icons.person,
            onChanged: (value) {
              _valueUsuario = value;
            },
          ),
          TextFieldContainer(
            child: TextField(
              onChanged: (value) {
                _valueContra = value;
              },
              obscureText: ocultarPass,
              decoration: InputDecoration(
                hintText: "Contraseña",
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      ocultarPass = !ocultarPass;
                    });
                  },
                  child: Icon(
                    ocultarPass ? Icons.visibility : Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () async {
              bool query =
                  await API().iniciarSesion(_valueUsuario, _valueContra);
              if (query) {
                if (_valueUsuario[0].toString() == 'V') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => RootVoluntario()),
                    ),
                  );
                } else {}
              }
            },
            child: Text(
              "ENTRAR".toUpperCase(),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              if (_valueUsuario == "") {
                Fluttertoast.showToast(
                  msg: "Ingrese un usuario para restablecer la contraseña",
                  backgroundColor: Colors.orange[700],
                  fontSize: 20,
                  gravity: ToastGravity.TOP,
                  textColor: Colors.white,
                  timeInSecForIosWeb: 2,
                );
              } else {
                bool query = await API().existeUsuario(_valueUsuario);
                if (query) {
                  controllerUsuario.text = "";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => RestablecerCuentaPage(
                            usuario: _valueUsuario,
                          )),
                    ),
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "El usuario ingresado no existe",
                    backgroundColor: Colors.red,
                    fontSize: 20,
                    gravity: ToastGravity.TOP,
                    textColor: Colors.white,
                    timeInSecForIosWeb: 2,
                  );
                }
              }
            },
            child: Text(
              "Olvide mi contraseña",
              style: TextStyle(color: Colors.grey),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 1,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  bool ocultarPass = false;
  Function? onTap;

  RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.ocultarPass,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: ocultarPass,
        decoration: InputDecoration(
          hintText: "Contraseña",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: onTap!(),
            child: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedInputField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
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
