import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:pet_app/model/adopcion.dart';
import 'package:pet_app/model/mascota.dart';
import 'package:pet_app/utils/color.dart';
import 'package:time_machine/time_machine.dart';
import '../../home/components/custom_image.dart';

class PetItemAux extends StatelessWidget {
  const PetItemAux(
      {Key? key,
      required this.data,
      this.width = 350,
      this.height = 500,
      this.radius = 40,
      this.onTap,
      this.onDeleteTap})
      : super(key: key);
  final Adopcion data;
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
        LocalDateTime.dateTime(DateTime.parse(data.fecha_nacimiento));
    Period diff = a.periodSince(b);
    cantidadMeses = diff.months;
    cantidadAnios = diff.years;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Stack(
          children: [
            Container(
              child: CustomImage(
                data.foto,
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
              bottom: 5,
              child: GlassContainer(
                borderRadius: BorderRadius.circular(25),
                blur: 10,
                opacity: 0.01,
                child: Container(
                  width: width,
                  height: 300,
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
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
                              data.nombre,
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
                              child: Container(),
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getAttribute(
                            Icons.transgender,
                            data.sexo,
                          ),
                          getAttribute(
                            Icons.color_lens_outlined,
                            data.color,
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
                            data.madurez,
                          ),
                          getAttributeText(
                            "Pelaje",
                            data.long_pelaje,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          "DATOS DEL ADOPTANTE",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getAttributeText(
                            "CI",
                            data.ci_adopt,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getAttributeText("Nombre", data.nombre_adopt),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getAttributeText(
                            "Fecha adopción",
                            data.fecha_adopcion,
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
                            data.telefono_adopt,
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
                            data.direccion_adopt,
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
