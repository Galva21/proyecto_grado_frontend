import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/voluntario/home/components/nueva_mascota.dart';
import 'package:pet_app/utils/color.dart';
import 'package:pet_app/utils/data.dart';
import 'package:pet_app/screens/voluntario/home/components/category_item.dart';
import 'package:pet_app/screens/voluntario/home/components/get_pets.dart';
import 'package:pet_app/screens/voluntario/home/components/pet_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            getCategories(),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "MIS MASCOTAS",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => NuevaMascotaPage()),
                      ),
                    );
                  },
                  child: Text(
                    "AGREGAR NUEVA MASCOTA".toUpperCase(),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                ),
                Spacer(),
              ],
            ),
            GetPets()
          ],
        ),
      ),
    );
  }

  int selectedCategory = 0;
  getCategories() {
    List<Widget> lists = List.generate(
        categories.length,
        (index) => CategoryItem(
              data: categories[index],
              selected: index == selectedCategory,
              onTap: () {
                setState(() {
                  selectedCategory = index;
                });
              },
            ));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }
}