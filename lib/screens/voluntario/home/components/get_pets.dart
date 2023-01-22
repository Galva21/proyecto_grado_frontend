import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/model/mascota.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/components/alert_dialog.dart';
import 'package:pet_app/screens/voluntario/home/components/nueva_adopcion.dart';
import 'package:pet_app/screens/voluntario/home/components/pet_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class GetPets extends StatefulWidget {
  const GetPets({Key? key}) : super(key: key);

  @override
  State<GetPets> createState() => _GetPetsState();
}

class _GetPetsState extends State<GetPets> {
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
        : provider.mascotas.length == 0
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
                      height: 450,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      viewportFraction: .8,
                    ),
                    items: provider.tipoSeleccionado == 0
                        ? List.generate(
                            provider.mascotas.length,
                            (index) => PetItem(
                              data: provider.mascotas[index],
                              width: width,
                              onTap: () async {
                                print(provider.mascotas[index].idMascota);
                                print(provider.usuarioLogeado.id);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => NuevaAdopcion(
                                          idMascota: provider
                                              .mascotas[index].idMascota!,
                                          idVoluntario:
                                              provider.usuarioLogeado.id,
                                        )),
                                  ),
                                );
                              },
                              onDeleteTap: () async {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialogSiNo(
                                      mensaje:
                                          "¿Seguro desea eliminar esta mascota?",
                                      onTap: () async {
                                        bool query = await API()
                                            .eliminar_mascota(provider
                                                .mascotas[index].idMascota!);
                                        if (query) {
                                          Fluttertoast.showToast(
                                            msg: "Mascota eliminada con exito",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.TOP,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 20,
                                          );
                                          provider.setMascotas();
                                          Navigator.pop(context);
                                        } else {
                                          Fluttertoast.showToast(
                                            msg:
                                                "Ocurrio un problema al eliminar a la mascota",
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
                          )
                        : provider.tipoSeleccionado == 1
                            ? List.generate(
                                provider.perros.length,
                                (index) => PetItem(
                                  data: provider.perros[index],
                                  width: width,
                                  onTap: () {},
                                  onDeleteTap: () async {
                                    bool query = await API().eliminar_mascota(
                                        provider.perros[index].idMascota!);
                                    if (query) {
                                      Fluttertoast.showToast(
                                        msg: "Mascota eliminada con exito",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 20,
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                        msg:
                                            "Ocurrio un problema al eliminar a la mascota",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 20,
                                      );
                                    }
                                  },
                                ),
                              )
                            : List.generate(
                                provider.gatos.length,
                                (index) => PetItem(
                                  data: provider.gatos[index],
                                  width: width,
                                  onTap: () {},
                                  onDeleteTap: () async {
                                    bool query = await API().eliminar_mascota(
                                        provider.gatos[index].idMascota!);
                                    if (query) {
                                      Fluttertoast.showToast(
                                        msg: "Mascota eliminada con exito",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 20,
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                        msg:
                                            "Ocurrio un problema al eliminar a la mascota",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 20,
                                      );
                                    }
                                  },
                                ),
                              ),
                  ),
                ],
              );
  }
}
