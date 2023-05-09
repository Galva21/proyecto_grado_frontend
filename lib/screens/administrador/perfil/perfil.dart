import 'package:flutter/material.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/components/alert_dialog.dart';
import 'package:pet_app/screens/splash_screen.dart';
import 'package:pet_app/utils/color.dart';
import 'package:provider/provider.dart';

class PerfilAdministrador extends StatefulWidget {
  const PerfilAdministrador({Key? key}) : super(key: key);

  @override
  State<PerfilAdministrador> createState() => _PerfilAdministradorState();
}

class _PerfilAdministradorState extends State<PerfilAdministrador> {
  final bool soloLectura = true;
  final _controllerTelefono = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerFoto = TextEditingController();
  final _controllerDireccion = TextEditingController();
  final _controllerPregunta = TextEditingController();
  final _controllerRespuesta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: true);
    _controllerDireccion.text = provider.usuarioLogeado.direccion;
    _controllerEmail.text = provider.usuarioLogeado.email;
    _controllerTelefono.text = provider.usuarioLogeado.telefono;
    _controllerFoto.text = provider.usuarioLogeado.foto;
    _controllerPregunta.text = provider.usuarioLogeado.preguntaRecuperacion;
    _controllerRespuesta.text = provider.usuarioLogeado.respuestaRecuperacion;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Colors.white,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            provider.usuarioLogeado.foto,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.usuarioLogeado.nombre +
                              " " +
                              provider.usuarioLogeado.apellidoPaterno +
                              " " +
                              provider.usuarioLogeado.apellidoMaterno,
                        ),
                        Text(provider.usuarioLogeado.ci),
                        Text(provider.usuarioLogeado.sexo),
                        Text(provider.usuarioLogeado.fechaNacimiento),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Telefono"),
                        RoundedInputField(
                          hint: "",
                          icon: Icons.add_reaction_outlined,
                          onChanged: (value) {},
                          controlador: _controllerTelefono,
                          modoEdicion: soloLectura,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Email"),
                        RoundedInputField(
                          hint: "",
                          icon: Icons.add_reaction_outlined,
                          onChanged: (value) {},
                          controlador: _controllerEmail,
                          modoEdicion: soloLectura,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Text("Foto url"),
                    RoundedInputField(
                      width: 0.0,
                      hint: "",
                      icon: Icons.add_reaction_outlined,
                      onChanged: (value) {},
                      controlador: _controllerFoto,
                      modoEdicion: soloLectura,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Text("Dirección"),
                    RoundedInputField(
                      width: 0.0,
                      hint: "",
                      icon: Icons.add_reaction_outlined,
                      onChanged: (value) {},
                      controlador: _controllerDireccion,
                      modoEdicion: soloLectura,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Text("Pregunta de recuperación"),
                    RoundedInputField(
                      width: 0.0,
                      hint: "",
                      icon: Icons.add_reaction_outlined,
                      onChanged: (value) {},
                      controlador: _controllerPregunta,
                      modoEdicion: soloLectura,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Text("Respuesta de recuperación"),
                    RoundedInputField(
                      width: 0.0,
                      hint: "",
                      icon: Icons.add_reaction_outlined,
                      onChanged: (value) {},
                      controlador: _controllerRespuesta,
                      modoEdicion: soloLectura,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialogSiNo(
                          mensaje: "¿Seguro desea cerrar sesión?",
                          icono: Icons.crisis_alert,
                          titulo: "Cierre de sesión",
                          color: Colors.red,
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => SplashScreen()),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Text(
                    "CERRAR SESIÓN".toUpperCase(),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 125,
                ),
              ],
            ),
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
  final TextEditingController? controlador;
  final bool modoEdicion;
  final double width;

  const RoundedInputField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.onChanged,
    required this.controlador,
    required this.modoEdicion,
    this.width = 175,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainerPerfil(
      width: width,
      child: TextField(
        readOnly: modoEdicion,
        textAlign: TextAlign.center,
        controller: controlador,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainerPerfil extends StatelessWidget {
  final Widget child;
  final double width;

  const TextFieldContainerPerfil({
    Key? key,
    required this.child,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: width != 175 ? size.width * 0.8 : width,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
