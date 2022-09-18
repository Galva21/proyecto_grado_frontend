import 'package:flutter/material.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/root_app.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/utils/data.dart';
import 'package:pet_app/widgets/user_simulator_item.dart';
import 'package:provider/provider.dart';
import '../widgets/category_item.dart';

class UserSimulator extends StatefulWidget {
  @override
  State<UserSimulator> createState() => _UserSimulatorState();
}

class _UserSimulatorState extends State<UserSimulator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        title: Center(child: Text("Simulación de usuario")),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(context),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "Espacio disponible",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            getEspacio(context),
            SizedBox(
              height: 25,
            ),
            Text(
              "Estado economico",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            getEconomia(context),
            SizedBox(
              height: 25,
            ),
            Text(
              "Tiempo disponible",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            getTiempo(context),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RootApp(),
                    ),
                  );
                },
                child: Center(
                  child: Text("Predecir"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int selectedEspacio = 0;
  getEspacio(BuildContext context) {
    final user_provider = Provider.of<UserProvider>(context);
    List<Widget> lists = List.generate(
      espacio.length,
      (index) => UserSimulatorItem(
        image: "assets/images/house.png",
        data: espacio[index],
        selected: index == selectedEspacio,
        onTap: () {
          setState(
            () {
              selectedEspacio = index;
              user_provider.espacioDisponible = index + 1;
            },
          );
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  int selectedEconomia = 0;
  getEconomia(BuildContext context) {
    final user_provider = Provider.of<UserProvider>(context);
    List<Widget> lists = List.generate(
      economia.length,
      (index) => UserSimulatorItem(
        image: "assets/images/money.png",
        data: economia[index],
        selected: index == selectedEconomia,
        onTap: () {
          setState(
            () {
              selectedEconomia = index;
              user_provider.estadoEconomico = index + 1;
            },
          );
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  int selectedTiempo = 0;
  getTiempo(BuildContext context) {
    final user_provider = Provider.of<UserProvider>(context);
    List<Widget> lists = List.generate(
      tiempo.length,
      (index) => UserSimulatorItem(
        image: "assets/images/time.png",
        data: tiempo[index],
        selected: index == selectedTiempo,
        onTap: () {
          setState(
            () {
              selectedTiempo = index;
              user_provider.tiempoDisponible = index + 1;
            },
          );
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }
}
