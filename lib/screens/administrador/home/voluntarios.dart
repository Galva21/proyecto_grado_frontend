import 'package:flutter/material.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/administrador/home/components/get_voluntarios.dart';
import 'package:pet_app/screens/administrador/home/components/nuevo_voluntario.dart';
import 'package:pet_app/utils/color.dart';
import 'package:provider/provider.dart';

class VoluntariosPage extends StatefulWidget {
  const VoluntariosPage({Key? key}) : super(key: key);

  @override
  State<VoluntariosPage> createState() => _VoluntariosPageState();
}

class _VoluntariosPageState extends State<VoluntariosPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.setVoluntarios();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            iconTheme: IconThemeData(color: labelColor),
            title: getAppBar(),
            centerTitle: true,
          ),
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
            // getCategories(),
            // SizedBox(
            //   height: 25,
            // ),
            Row(
              children: [
                Spacer(),
                Text(
                  "MIS VOLUNTARIOS",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => NuevoVoluntario()),
                      ),
                    ).then((value) {
                      final provider =
                          Provider.of<UserProvider>(context, listen: false);
                      provider.setVoluntarios();
                    });
                  },
                  child: Text(
                    "AGREGAR NUEVO VOLUNTARIO".toUpperCase(),
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
            GetVoluntarios(),
            // GetPets()
          ],
        ),
      ),
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
