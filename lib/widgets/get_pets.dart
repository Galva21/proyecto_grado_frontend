import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_app/widgets/pet_item.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';
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
    final user_provider = Provider.of<UserProvider>(context, listen: false);
    print("cantidad de animales: " +
        user_provider.mascotaPredecible.length.toString());
    return cargando == true
        ? Center(
            child: Container(
              height: 500,
              width: 500,
              child: Lottie.network(
                  "https://assets6.lottiefiles.com/private_files/lf30_fup2uejx.json"),
            ),
          )
        : user_provider.mascotaPredecible.length == 0
            ? Center(
                child: Container(
                  height: 500,
                  width: 500,
                  child: Column(
                    children: [
                      Lottie.network(
                          "https://assets7.lottiefiles.com/packages/lf20_hl5n0bwb.json"),
                      Text("SIN DATOS"),
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
                      user_provider.mascotaPredecible.length,
                      (index) => PetItem(
                        data: user_provider.mascotaPredecible[index],
                        width: width,
                        onTap: () {},
                        onFavoriteTap: () {
                          setState(
                            () {
                              user_provider
                                      .mascotaPredecible[index].is_favorite =
                                  !user_provider
                                      .mascotaPredecible[index].is_favorite;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  // Text(
                  //   "Total: " +
                  //       user_provider.mascotaPredecible.length.toString(),
                  // ),
                ],
              );
  }
}
