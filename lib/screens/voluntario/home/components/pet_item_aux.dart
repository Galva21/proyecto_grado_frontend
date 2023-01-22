import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:pet_app/model/mascota.dart';
import 'package:pet_app/utils/color.dart';
import 'package:time_machine/time_machine.dart';
import 'custom_image.dart';

class PetItemAux extends StatelessWidget {
  const PetItemAux(
      {Key? key,
      required this.data,
      this.width = 350,
      this.height = 400,
      this.radius = 40,
      this.onTap,
      this.onDeleteTap})
      : super(key: key);
  final Mascota data;
  final double width;
  final double height;
  final double radius;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    int cantidadMeses = 0;
    int cantidadAnios = 0;
    LocalDateTime a = LocalDateTime.now();
    LocalDateTime b =
        LocalDateTime.dateTime(DateTime.parse(data.fechaNacimiento!));
    Period diff = a.periodSince(b);
    cantidadMeses = diff.months;
    cantidadAnios = diff.years;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 500,
        margin: EdgeInsets.fromLTRB(30, 0, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Stack(
          children: [
            Container(
              child: CustomImage(
                data.foto!,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(radius),
                  bottom: Radius.zero,
                ),
                isShadow: false,
                width: width,
                height: 250,
              ),
            ),
            Positioned(
              bottom: 20,
              child: GlassContainer(
                borderRadius: BorderRadius.circular(25),
                blur: 10,
                opacity: 0.05,
                child: Container(
                  width: width,
                  height: 270,
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        // offset: Offset(
                        //   0,
                        //   2,
                        // ), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              data.nombre!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: glassTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            flex: 8,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: onDeleteTap,
                              child: Container(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red.shade400,
                                ),
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                            flex: 2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // Text(
                      //   data.descripcion!,
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      //   style: TextStyle(
                      //     color: glassLabelColor,
                      //     fontSize: 13,
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getAttribute(
                            Icons.transgender,
                            data.sexo!,
                          ),
                          getAttribute(
                            Icons.color_lens_outlined,
                            data.color!,
                          ),
                          getAttribute(
                            Icons.calendar_month_outlined,
                            cantidadAnios == 0
                                ? cantidadMeses.toString() + " meses"
                                : cantidadAnios.toString() +
                                    " años y " +
                                    cantidadMeses.toString() +
                                    " meses",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getAttributeSiNo(
                            data.vacunado == "Si" ? true : false,
                            "Vacunado",
                          ),
                          getAttributeSiNo(
                            data.esterilizado == "Si" ? true : false,
                            "Esterilizado",
                          ),
                          getAttributeSiNo(
                            data.desparacitado == "Si" ? true : false,
                            "Desparacitado",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getAttributeText(
                            "Madurez",
                            data.madurez!,
                          ),
                          getAttributeText(
                            "Pelaje",
                            data.pelaje!,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "----------------------------------------------------------------------------------",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getAttributeText(
                            "CI",
                            "16398422",
                          ),
                          getAttributeText(
                            "Nombre",
                            "Carlos Torres",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getAttributeText(
                            "Telefono",
                            "7365698",
                          ),
                          getAttributeText(
                            "Fecha",
                            "2022-12-05",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getAttributeText(
                            "Dirección",
                            "Calle los angeles #123 Villa Armonia",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getAttribute(IconData icon, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }

  getAttributeSiNo(bool sino, String info) {
    return Row(
      children: [
        Icon(
          Icons.checklist_sharp,
          size: 18,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: sino ? Colors.green : Colors.redAccent,
              fontSize: 13,
              fontWeight: FontWeight.w900),
        ),
      ],
    );
  }

  getAttributeText(String campo, String info) {
    return Row(
      children: [
        Icon(
          Icons.adjust_sharp,
          size: 18,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          campo + ": ",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}
