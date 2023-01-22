import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_app/database/api.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/voluntario/home/components/pet_item.dart';
import 'package:provider/provider.dart';

class GetPetAdopcion extends StatefulWidget {
  const GetPetAdopcion({Key? key}) : super(key: key);

  @override
  State<GetPetAdopcion> createState() => _GetPetAdopcionState();
}

class _GetPetAdopcionState extends State<GetPetAdopcion> {
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
                      height: 400,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      viewportFraction: .8,
                    ),
                    items: List.generate(
                      provider.mascotas.length,
                      (index) => PetItem(
                        data: provider.mascotas[index],
                        width: width,
                        onTap: () {},
                        onDeleteTap: () {},
                      ),
                    ),
                  ),
                ],
              );
  }
}
