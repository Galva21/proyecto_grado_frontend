import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/model/adopcion.dart';
import 'package:pet_app/model/mascota.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/voluntario/adopciones/components/pet_item_aux.dart';
import 'package:pet_app/utils/color.dart';
import 'package:provider/provider.dart';

class AdoptantesPage extends StatefulWidget {
  const AdoptantesPage({Key? key}) : super(key: key);

  @override
  State<AdoptantesPage> createState() => _AdoptantesPageState();
}

class _AdoptantesPageState extends State<AdoptantesPage> {
  bool _sinFiltro = true;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: true);
    double width = MediaQuery.of(context).size.width * .8;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(provider, width),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  buildBody(UserProvider provider, double width) {
    String _campo = "";
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
              height: 50.0,
              alignment: Alignment.center,
              child: const Text(
                'ADOPCIONES',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
              children: [
                Spacer(),
                TextFieldContainerAxuliar(
                  child: TextField(
                    autofocus: false,
                    onChanged: (value) {
                      print(value);
                      _campo = value;
                      if (value.length == 0) {
                        provider.limpiarAdopcionesFiltradas();
                        Future.delayed(Duration(milliseconds: 1000))
                            .then((value) {
                          setState(() {
                            _sinFiltro = true;
                            print(provider.adopciones);
                            print(provider.adopciones.length);
                          });
                        });
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.add_reaction_outlined,
                          color: kPrimaryColor),
                      hintText: "CI o Nombre Adoptante",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    provider.setAdopcionesFiltradas(_campo);
                    Future.delayed(Duration(microseconds: 1000)).then((value) {
                      setState(() {
                        _sinFiltro = false;
                        print(provider.adopcionesFiltradas);
                        print(provider.adopcionesFiltradas.length);
                      });
                    });
                  },
                  child: Icon(Icons.search),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Center(
            //   child: Text("Mascotas adoptadas este mes"),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            _sinFiltro
                ? CarouselSlider(
                    options: CarouselOptions(
                      height: 470,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      viewportFraction: .8,
                    ),
                    items: List.generate(
                      provider.adopciones.length,
                      (index) => PetItemAux(
                        width: width,
                        data: Adopcion(
                          ci_adopt: provider.adopciones[index].ci_adopt,
                          color: provider.adopciones[index].color,
                          desparacitado:
                              provider.adopciones[index].desparacitado,
                          direccion_adopt:
                              provider.adopciones[index].direccion_adopt,
                          esterilizado: provider.adopciones[index].esterilizado,
                          fecha_adopcion:
                              provider.adopciones[index].fecha_adopcion,
                          fecha_ingreso:
                              provider.adopciones[index].fecha_ingreso,
                          fecha_nacimiento:
                              provider.adopciones[index].fecha_nacimiento,
                          fecha_salida: provider.adopciones[index].fecha_salida,
                          foto: provider.adopciones[index].foto,
                          id_adopcion: provider.adopciones[index].id_adopcion,
                          id_mascota: provider.adopciones[index].id_mascota,
                          id_voluntario:
                              provider.adopciones[index].id_voluntario,
                          long_pelaje: provider.adopciones[index].long_pelaje,
                          madurez: provider.adopciones[index].madurez,
                          nombre: provider.adopciones[index].nombre,
                          nombre_adopt: provider.adopciones[index].nombre_adopt,
                          sexo: provider.adopciones[index].sexo,
                          telefono_adopt:
                              provider.adopciones[index].telefono_adopt,
                          tiempo_adopcion:
                              provider.adopciones[index].tiempo_adopcion,
                          tipo: provider.adopciones[index].tipo,
                          vacunado: provider.adopciones[index].vacunado,
                        ),
                      ),
                    ))
                : CarouselSlider(
                    options: CarouselOptions(
                      height: 465,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      viewportFraction: .8,
                    ),
                    items: List.generate(
                      provider.adopcionesFiltradas.length,
                      (index) => PetItemAux(
                        width: width,
                        data: Adopcion(
                          ci_adopt:
                              provider.adopcionesFiltradas[index].ci_adopt,
                          color: provider.adopcionesFiltradas[index].color,
                          desparacitado:
                              provider.adopcionesFiltradas[index].desparacitado,
                          direccion_adopt: provider
                              .adopcionesFiltradas[index].direccion_adopt,
                          esterilizado:
                              provider.adopcionesFiltradas[index].esterilizado,
                          fecha_adopcion: provider
                              .adopcionesFiltradas[index].fecha_adopcion,
                          fecha_ingreso:
                              provider.adopcionesFiltradas[index].fecha_ingreso,
                          fecha_nacimiento: provider
                              .adopcionesFiltradas[index].fecha_nacimiento,
                          fecha_salida:
                              provider.adopcionesFiltradas[index].fecha_salida,
                          foto: provider.adopcionesFiltradas[index].foto,
                          id_adopcion:
                              provider.adopcionesFiltradas[index].id_adopcion,
                          id_mascota:
                              provider.adopcionesFiltradas[index].id_mascota,
                          id_voluntario:
                              provider.adopcionesFiltradas[index].id_voluntario,
                          long_pelaje:
                              provider.adopcionesFiltradas[index].long_pelaje,
                          madurez: provider.adopcionesFiltradas[index].madurez,
                          nombre: provider.adopcionesFiltradas[index].nombre,
                          nombre_adopt:
                              provider.adopcionesFiltradas[index].nombre_adopt,
                          sexo: provider.adopcionesFiltradas[index].sexo,
                          telefono_adopt: provider
                              .adopcionesFiltradas[index].telefono_adopt,
                          tiempo_adopcion: provider
                              .adopcionesFiltradas[index].tiempo_adopcion,
                          tipo: provider.adopcionesFiltradas[index].tipo,
                          vacunado:
                              provider.adopcionesFiltradas[index].vacunado,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class TextFieldContainerAxuliar extends StatelessWidget {
  final Widget child;

  const TextFieldContainerAxuliar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.6,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
