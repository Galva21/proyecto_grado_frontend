import 'package:flutter/material.dart';
import 'package:pet_app/model/mascota.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/voluntario/adopciones/components/get_adoptantes.dart';
import 'package:pet_app/screens/voluntario/adopciones/components/nuevo_adoptante.dart';
import 'package:pet_app/screens/voluntario/home/components/pet_item.dart';
import 'package:pet_app/screens/voluntario/home/components/pet_item_aux.dart';
import 'package:pet_app/utils/color.dart';
import 'package:provider/provider.dart';

class AdoptantesPage extends StatefulWidget {
  const AdoptantesPage({Key? key}) : super(key: key);

  @override
  State<AdoptantesPage> createState() => _AdoptantesPageState();
}

class _AdoptantesPageState extends State<AdoptantesPage> {
  bool activar = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.setAdoptantes();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   backgroundColor: appBarColor,
          //   pinned: true,
          //   snap: true,
          //   floating: true,
          //   iconTheme: IconThemeData(color: labelColor),
          //   title: getAppBar(),
          //   centerTitle: true,
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  buildBody() {
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
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
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
            // getCategories(),
            // SizedBox(
            //   height: 25,
            // ),
            Row(
              children: [
                Spacer(),
                TextFieldContainerAxuliar(
                  child: TextField(
                    onChanged: (value) {
                      // _nombre = value;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.add_reaction_outlined,
                          color: kPrimaryColor),
                      hintText: "Nombre",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      activar = true;
                      print(activar);
                    });
                  },
                  child: Text(
                    "Buscar".toUpperCase(),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            // GetAdoptantes(),
            activar ? mascotaAdoptada() : Container(),
          ],
        ),
      ),
    );
  }

  Widget mascotaAdoptada() {
    return PetItemAux(
      data: Mascota(
          idMascota: "0",
          color: "Negro",
          descripcion: "",
          desparacitado: "Si",
          esterilizado: "No",
          vacunado: "No",
          tipo: "Perro",
          tiempoAdopcion: 2,
          sexo: "Macho",
          raza: "",
          fechaIngreso: "2022-06-06",
          fechaNacimiento: "2022-01-15",
          pelaje: "Corto",
          nombre: "Firu",
          madurez: "Mediano",
          fechaSalida: "2022-12-05",
          foto:
              "https://static.nationalgeographic.es/files/styles/image_3200/public/01-stray-dogs-nationalgeographic_1927666.jpg?w=1600&h=900"),
      width: 350,
      onTap: () async {},
      onDeleteTap: () async {},
    );
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.pets,
                      color: labelColor,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "ALBERGUE DE MASCOTAS 'PELUCHIN'",
                      style: TextStyle(
                        color: labelColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "La Paz, Bolivia",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
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
