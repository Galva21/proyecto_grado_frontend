import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/components/alert_dialog.dart';
import 'package:pet_app/screens/voluntario/home/components/pet_item.dart';
import 'package:pet_app/utils/color.dart';
import 'package:provider/provider.dart';

class PrediccionMascotas extends StatefulWidget {
  const PrediccionMascotas({Key? key}) : super(key: key);

  @override
  State<PrediccionMascotas> createState() => _PrediccionMascotasState();
}

class _PrediccionMascotasState extends State<PrediccionMascotas> {
  DropdownMenuItem<String> buildMenuItemTipos(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
  final itemsPrediccion = [
    '1 a 7 días',
    '8 a 30 días',
    '31 a 90 días',
    'Despues de 100 días'
  ];
  String? _prediccion;
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
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.setMascotas();
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
                  'PREDICCIÓN DEL TIEMPO DE ADOPCIÓN',
                  textAlign: TextAlign.center,
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
                    child: Text("Adopción"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: DropdownButton<String>(
                      value: _prediccion,
                      items: itemsPrediccion.map(buildMenuItemTipos).toList(),
                      onChanged: (value) {
                        setState(() {
                          int index = 0;
                          _prediccion = value;
                          if (value == "1 a 7 días") {
                            index = 1;
                          } else if (value == "8 a 30 días") {
                            index = 2;
                          } else if (value == "31 a 90 días") {
                            index = 3;
                          } else {
                            index = 4;
                          }
                          provider.setPrediccionSeleccionado = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              cargando == true
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
                                  height: 400,
                                  enlargeCenterPage: true,
                                  disableCenter: true,
                                  viewportFraction: .8,
                                ),
                                items: provider.prediccionSeleccionado == 1
                                    ? List.generate(
                                        provider.prediccion1.length,
                                        (index) => PetItem(
                                          data: provider.prediccion1[index],
                                          width: width,
                                          onTap: () {},
                                          onDeleteTap: () async {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialogSiNo(
                                                  mensaje:
                                                      "¿Seguro desea eliminar esta mascota?",
                                                  onTap: () async {
                                                    bool query = await API()
                                                        .eliminar_mascota(
                                                            provider
                                                                .prediccion1[
                                                                    index]
                                                                .idMascota!);
                                                    if (query) {
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "Mascota eliminada con exito",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.TOP,
                                                        backgroundColor:
                                                            Colors.green,
                                                        textColor: Colors.white,
                                                        fontSize: 20,
                                                      );
                                                      provider.setMascotas();
                                                      Navigator.pop(context);
                                                    } else {
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "Ocurrio un problema al eliminar a la mascota",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.TOP,
                                                        backgroundColor:
                                                            Colors.red,
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
                                    : provider.prediccionSeleccionado == 2
                                        ? List.generate(
                                            provider.prediccion2.length,
                                            (index) => PetItem(
                                              data: provider.prediccion2[index],
                                              width: width,
                                              onTap: () {},
                                              onDeleteTap: () async {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialogSiNo(
                                                      mensaje:
                                                          "¿Seguro desea eliminar esta mascota?",
                                                      onTap: () async {
                                                        bool query = await API()
                                                            .eliminar_mascota(
                                                                provider
                                                                    .prediccion2[
                                                                        index]
                                                                    .idMascota!);
                                                        if (query) {
                                                          Fluttertoast
                                                              .showToast(
                                                            msg:
                                                                "Mascota eliminada con exito",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .TOP,
                                                            backgroundColor:
                                                                Colors.green,
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 20,
                                                          );
                                                          provider
                                                              .setMascotas();
                                                          Navigator.pop(
                                                              context);
                                                        } else {
                                                          Fluttertoast
                                                              .showToast(
                                                            msg:
                                                                "Ocurrio un problema al eliminar a la mascota",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .TOP,
                                                            backgroundColor:
                                                                Colors.red,
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 20,
                                                          );
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          )
                                        : provider.prediccionSeleccionado == 3
                                            ? List.generate(
                                                provider.prediccion3.length,
                                                (index) => PetItem(
                                                  data: provider
                                                      .prediccion3[index],
                                                  width: width,
                                                  onTap: () {},
                                                  onDeleteTap: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialogSiNo(
                                                          mensaje:
                                                              "¿Seguro desea eliminar esta mascota?",
                                                          onTap: () async {
                                                            bool query = await API()
                                                                .eliminar_mascota(provider
                                                                    .prediccion3[
                                                                        index]
                                                                    .idMascota!);
                                                            if (query) {
                                                              Fluttertoast
                                                                  .showToast(
                                                                msg:
                                                                    "Mascota eliminada con exito",
                                                                toastLength: Toast
                                                                    .LENGTH_SHORT,
                                                                gravity:
                                                                    ToastGravity
                                                                        .TOP,
                                                                backgroundColor:
                                                                    Colors
                                                                        .green,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                fontSize: 20,
                                                              );
                                                              provider
                                                                  .setMascotas();
                                                              Navigator.pop(
                                                                  context);
                                                            } else {
                                                              Fluttertoast
                                                                  .showToast(
                                                                msg:
                                                                    "Ocurrio un problema al eliminar a la mascota",
                                                                toastLength: Toast
                                                                    .LENGTH_SHORT,
                                                                gravity:
                                                                    ToastGravity
                                                                        .TOP,
                                                                backgroundColor:
                                                                    Colors.red,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                fontSize: 20,
                                                              );
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              )
                                            : provider.prediccionSeleccionado ==
                                                    4
                                                ? List.generate(
                                                    provider.prediccion4.length,
                                                    (index) => PetItem(
                                                      data: provider
                                                          .prediccion4[index],
                                                      width: width,
                                                      onTap: () {},
                                                      onDeleteTap: () async {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialogSiNo(
                                                              mensaje:
                                                                  "¿Seguro desea eliminar esta mascota?",
                                                              onTap: () async {
                                                                bool query = await API()
                                                                    .eliminar_mascota(provider
                                                                        .prediccion4[
                                                                            index]
                                                                        .idMascota!);
                                                                if (query) {
                                                                  Fluttertoast
                                                                      .showToast(
                                                                    msg:
                                                                        "Mascota eliminada con exito",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity:
                                                                        ToastGravity
                                                                            .TOP,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    fontSize:
                                                                        20,
                                                                  );
                                                                  provider
                                                                      .setMascotas();
                                                                  Navigator.pop(
                                                                      context);
                                                                } else {
                                                                  Fluttertoast
                                                                      .showToast(
                                                                    msg:
                                                                        "Ocurrio un problema al eliminar a la mascota",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity:
                                                                        ToastGravity
                                                                            .TOP,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    fontSize:
                                                                        20,
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                }
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : List.generate(
                                                    0,
                                                    (index) => PetItem(
                                                      data: provider
                                                          .mascotas[index],
                                                      width: width,
                                                      onTap: () {},
                                                      onDeleteTap: () async {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialogSiNo(
                                                              mensaje:
                                                                  "¿Seguro desea eliminar esta mascota?",
                                                              onTap: () async {
                                                                bool query = await API()
                                                                    .eliminar_mascota(provider
                                                                        .mascotas[
                                                                            index]
                                                                        .idMascota!);
                                                                if (query) {
                                                                  Fluttertoast
                                                                      .showToast(
                                                                    msg:
                                                                        "Mascota eliminada con exito",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity:
                                                                        ToastGravity
                                                                            .TOP,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    fontSize:
                                                                        20,
                                                                  );
                                                                  provider
                                                                      .setMascotas();
                                                                  Navigator.pop(
                                                                      context);
                                                                } else {
                                                                  Fluttertoast
                                                                      .showToast(
                                                                    msg:
                                                                        "Ocurrio un problema al eliminar a la mascota",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity:
                                                                        ToastGravity
                                                                            .TOP,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    fontSize:
                                                                        20,
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                }
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  )),
                          ],
                        )
            ],
          ),
        ),
      ),
    );
  }
}
