import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:pet_app/model/Usuario.dart';
import 'package:pet_app/screens/voluntario/home/components/custom_image.dart';
import 'package:pet_app/utils/color.dart';

class UsuarioItem extends StatelessWidget {
  const UsuarioItem(
      {Key? key,
      this.data,
      this.width = 350,
      this.height = 400,
      this.radius = 40,
      this.onTap,
      this.onDeleteTap})
      : super(key: key);
  final Usuario? data;
  final double width;
  final double height;
  final double radius;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.grey.shade300
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(3),
              child: CustomImage(
                data!.foto,
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
                  height: 200,
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
                              data!.nombre+" "+data!.apellidoPaterno+" "+data!.apellidoMaterno,
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
                        data!.direccion,
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
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getAttribute("CI: ", data!.ci),
                              getAttribute("Telefono: ", data!.telefono),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getAttribute("Genero: ", data!.sexo),
                              getAttribute("Email: ", data!.email),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getAttribute("Pregunta: ", data!.preguntaRecuperacion),
                            ],
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

  getAttribute(String campo, String info) {
    return Row(
      children: [
        Text("º ${campo}"),
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
