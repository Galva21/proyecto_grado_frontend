import 'package:flutter/material.dart';

class AlertDialogSiNo extends StatelessWidget {
  final String titulo;
  final String mensaje;
  final Color color;
  final IconData icono;
  final GestureTapCallback? onTap;

  const AlertDialogSiNo({
    Key? key,
    this.titulo = "ALERTA",
    this.mensaje = "¿?",
    this.color = Colors.red,
    this.icono = Icons.dangerous,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 250,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    mensaje,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("No"),
                      ),
                      ElevatedButton(
                        onPressed: onTap,
                        child: Text("Si"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundColor: color,
              radius: 60,
              child: Icon(
                icono,
                size: 50,
                color: Colors.white,
              ),
            ),
            top: -60,
          )
        ],
      ),
    );
  }
}
