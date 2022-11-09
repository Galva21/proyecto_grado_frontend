import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/model/mascota.dart';
import 'package:pet_app/utils/data.dart';
import 'package:provider/provider.dart';

class MLapi {
  Future<int> getPrediccion({
    int? tipo = 3,
    int? edad = 3,
    int? sexo = 3,
    int? color = 3,
    int? madurez = 3,
    int? vacunado = 3,
    int? desparacitado = 3,
    int? esterilizado = 3,
  }) async {
    var url = Uri.parse('https://serene-escarpment-63545.herokuapp.com/');
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, int>{
          "tipo": tipo!,
          "edad": edad!,
          "sexo": sexo!,
          "color": color!,
          "madurez": madurez!,
          "vacunado": vacunado!,
          "desparacitado": desparacitado!,
          "esterilizado": esterilizado!
        }));
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    int r = int.parse(response.body.split(':')[1][0].toString());
    print("prediction: "+ r.toString());
    return r;
  }

  // Future getMascotas(BuildContext context) async {
  //   final user_provider = Provider.of<UserProvider>(context, listen: false);
  //   user_provider.mascotaPredecible.clear();
  //   List<Mascota> mascotasPredecibles = [];
  //   Mascota.mascotas.forEach((e) async {
  //     await getPrediccion(
  //       espacio: user_provider.espacioDisponible,
  //       economia: user_provider.estadoEconomico,
  //       tiempo: user_provider.tiempoDisponible,
  //       tamanio: e.tamaniogrande,
  //     ).then((value) => value==1 ? user_provider.mascotaPredecible.add(e) : 0);
  //   });
  // }
}
