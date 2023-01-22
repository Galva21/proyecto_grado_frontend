import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/administrador/home/components/usuario_item.dart';
import 'package:pet_app/screens/components/alert_dialog.dart';
import 'package:provider/provider.dart';

class GetVoluntarios extends StatefulWidget {
  const GetVoluntarios({Key? key}) : super(key: key);

  @override
  State<GetVoluntarios> createState() => _GetVoluntariosState();
}

class _GetVoluntariosState extends State<GetVoluntarios> {
  bool cargando = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) {
      setState(() {
        cargando = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .8;
    final provider = Provider.of<UserProvider>(context, listen: true);
    return cargando == true
        ? Center(
            child: Container(
              height: 500,
              width: 500,
              child: Lottie.network(
                "https://assets6.lottiefiles.com/private_files/lf30_fup2uejx.json",
              ),
            ),
          )
        : provider.voluntarios.length == 0
            ? Center(
                child: Container(
                  height: 500,
                  width: 500,
                  child: Column(
                    children: [
                      Lottie.network(
                        "https://assets7.lottiefiles.com/packages/lf20_hl5n0bwb.json",
                      ),
                      Text(
                        "SIN DATOS",
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 500,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      viewportFraction: .8,
                    ),
                    items: List.generate(
                      provider.voluntarios.length,
                      (index) => UsuarioItem(
                        data: provider.voluntarios[index],
                        width: width,
                        onTap: () {},
                        onDeleteTap: () async {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialogSiNo(
                                mensaje:
                                    "¿Seguro desea eliminar este voluntario?",
                                onTap: () async {
                                  bool query = await API().eliminar_voluntario(
                                      provider.voluntarios[index].id);
                                  if (query) {
                                    Fluttertoast.showToast(
                                      msg: "Voluntario eliminado con exito",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 20,
                                    );
                                    provider.setVoluntarios();
                                    Navigator.pop(context);
                                  } else {
                                    Fluttertoast.showToast(
                                      msg:
                                          "Ocurrio un problema al eliminar al voluntario",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 20,
                                    );
                                    Navigator.pop(context);
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
  }
}
