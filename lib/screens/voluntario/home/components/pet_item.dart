import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:pet_app/model/mascota.dart';
import 'package:pet_app/utils/color.dart';
import 'package:time_machine/time_machine.dart';
import 'custom_image.dart';

class PetItem extends StatelessWidget {
  const PetItem(
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
        height: height,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                height: 350,
              ),
            ),
            Positioned(
              bottom: 0,
              child: GlassContainer(
                borderRadius: BorderRadius.circular(25),
                blur: 10,
                opacity: 0.15,
                child: Container(
                  width: width,
                  height: 110,
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
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
                                fontWeight: FontWeight.w600,
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
                      Text(
                        data.descripcion!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: glassLabelColor,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 15,
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
                                    " año/s y " +
                                    cantidadMeses.toString() +
                                    " mes/es",
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
          style: TextStyle(color: textColor, fontSize: 13),
        ),
      ],
    );
  }
}
