import 'package:flutter/material.dart';

class Mascota {
  String nombre;
  String caracteristica;
  String genero;
  String color;
  String edad;
  String imagen;
  int tamaniogrande;
  bool is_favorite;

  Mascota({
    required this.nombre,
    required this.caracteristica,
    required this.genero,
    required this.color,
    required this.edad,
    required this.imagen,
    required this.tamaniogrande,
    required this.is_favorite,
  });

  static List<Mascota> mascotas = [
    Mascota(
      nombre: "Choco",
      caracteristica: "Tierno, Amable, Jugueton",
      genero: "Macho",
      color: "Marron",
      edad: "3 años",
      imagen:
          "https://scontent.flpb2-1.fna.fbcdn.net/v/t39.30808-6/307693891_5116216015149949_5912781943383280433_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=2wEyAFm7EykAX85vQvo&_nc_ht=scontent.flpb2-1.fna&oh=00_AT93TTP6bi-iHIGBYWZb0qBN9Wur2JBOrR_-bbTCbh3PPw&oe=632C9F50",
      tamaniogrande: 3,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Sullu",
      caracteristica: "Jugueton, Perezozo",
      genero: "Hembra",
      color: "Negro",
      edad: "3 meses",
      imagen:
          "https://scontent.flpb2-1.fna.fbcdn.net/v/t39.30808-6/306632930_5116217305149820_6468754224032583367_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=21gI-7rYhk4AX9_rV4F&_nc_ht=scontent.flpb2-1.fna&oh=00_AT8ijHvSA_gLrUQdnyWccQSAkxXSaSkQI3n6im7wBu_7Uw&oe=632BF50B",
      tamaniogrande: 1,
      is_favorite: false,
    ),
    Mascota(
      nombre: "Pepe",
      caracteristica: "Amigable, Comelon",
      genero: "Macho",
      color: "Marron",
      edad: "5 meses",
      imagen:"https://scontent.flpb2-2.fna.fbcdn.net/v/t39.30808-6/306583309_5116218355149715_4196700104226622579_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=0X9MJKPmauYAX9aQH6_&_nc_ht=scontent.flpb2-2.fna&oh=00_AT8CqlsoLK7TSzkXjhhRCwUwhD9pD8gQjXwqPR0B8Pm_AA&oe=632CB397",
      tamaniogrande: 2,
      is_favorite: false,
    ),
    Mascota(
      nombre: "Coco",
      caracteristica: "Cuidador, Amigable, Cariñoso",
      genero: "Hembra",
      color: "Marron",
      edad: "2 años",
      imagen:
          "https://scontent.flpb2-2.fna.fbcdn.net/v/t39.30808-6/307941437_5116218928482991_2888887155418982451_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=gZi14yZ-RcoAX8Melhn&tn=St7BLE_wCe00v9m-&_nc_ht=scontent.flpb2-2.fna&oh=00_AT8WxvVbcU4Mb3L7FwoJpSm3GZ3qZ79IyDPpIZhgU5_ffQ&oe=632C0FBB",
      tamaniogrande: 2,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Missy",
      caracteristica: "Valiente, Cariñoso",
      genero: "Hembra",
      color: "Blanca",
      edad: "2 años",
      imagen:
          "https://scontent.flpb2-1.fna.fbcdn.net/v/t39.30808-6/307526403_5116743621763855_8707289663809111732_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=obmczGSJIb8AX_CmXKe&_nc_ht=scontent.flpb2-1.fna&oh=00_AT8AUzMb_jzOfWC0yGlCYkddb2_XgMvQ2irROVfWZUI3MQ&oe=632DCE02",
      tamaniogrande: 2,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Michelle",
      caracteristica: "Tranquila, Cariñoso",
      genero: "Hembra",
      color: "Cafe",
      edad: "2 años",
      imagen:
          "https://scontent.flpb2-1.fna.fbcdn.net/v/t39.30808-6/306723457_5106166472821570_4431906199054781318_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=nbZ70kPSbT4AX86xIhw&_nc_ht=scontent.flpb2-1.fna&oh=00_AT_m8Augg9nD6TcvzM-DU6C8HOkv1RR4VIrkAyFbDAX9jQ&oe=632CF812",
      tamaniogrande: 2,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Byron",
      caracteristica: "Jugueton, Cariñoso",
      genero: "Macho",
      color: "Blanco",
      edad: "5 años",
      imagen:
          "https://scontent.flpb2-2.fna.fbcdn.net/v/t39.30808-6/304549215_5071496719621879_982048091065352830_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=NV-RG_SAfKsAX8hlgP-&_nc_ht=scontent.flpb2-2.fna&oh=00_AT9XiGbTCNpJ6NkMQDT0q5bOSodlme6m1XZVKe370e7K7w&oe=632D8817",
      tamaniogrande: 1,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Tom",
      caracteristica: "Comelon, Cariñoso, Jugueton",
      genero: "Macho",
      color: "Blanco",
      edad: "2 años",
      imagen:
          "https://scontent.flpb2-2.fna.fbcdn.net/v/t39.30808-6/305974842_5098445283593689_6299134115157529871_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=DwyCajgC20IAX_DFiPI&_nc_ht=scontent.flpb2-2.fna&oh=00_AT_ZhWNJ6j9J89O9u2cUAcnix411mYsghCdki0nzgHEi_A&oe=632CAA17",
      tamaniogrande: 1,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Kylie",
      caracteristica: "Sociable, Cariñoso, Jugueton",
      genero: "Macho",
      color: "Cafe con negro",
      edad: "4 años",
      imagen:
          "https://scontent.flpb2-2.fna.fbcdn.net/v/t39.30808-6/306362677_5098122336959317_6459946394177576275_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=6PMRH8IHEj8AX9NxIiL&tn=St7BLE_wCe00v9m-&_nc_ht=scontent.flpb2-2.fna&oh=00_AT_UimXhLJMRtTMxeu2gaWxr98zPEdNYOjXd90pSmST5ww&oe=632C0811",
      tamaniogrande: 3,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Honey",
      caracteristica: "Cariñosa, Sociable",
      genero: "Hembra",
      color: "Gringo",
      edad: "2 años",
      imagen:
          "https://scontent.flpb2-2.fna.fbcdn.net/v/t39.30808-6/306362677_5098122336959317_6459946394177576275_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=6PMRH8IHEj8AX9NxIiL&tn=St7BLE_wCe00v9m-&_nc_ht=scontent.flpb2-2.fna&oh=00_AT_UimXhLJMRtTMxeu2gaWxr98zPEdNYOjXd90pSmST5ww&oe=632C0811",
      tamaniogrande: 3,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Chester",
      caracteristica: "Cariñoso, Sociable, Jugueton",
      genero: "Macho",
      color: "Gringo",
      edad: "1 años",
      imagen:
          "https://scontent.flpb2-2.fna.fbcdn.net/v/t39.30808-6/305226845_5092725997498951_4909521464753389333_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=M3gUVel_iZ4AX_uowAV&_nc_ht=scontent.flpb2-2.fna&oh=00_AT93qAuYc41D7gLmLaxcaHAnQE855oxVaI2Xkeq06_NkMA&oe=632CA607",
      tamaniogrande: 1,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Felipe",
      caracteristica: "Cariñoso, Sociable, Jugueton",
      genero: "Macho",
      color: "Negro y marron",
      edad: "2 años",
      imagen:
          "https://scontent.flpb2-1.fna.fbcdn.net/v/t39.30808-6/305624421_5084574471647437_588895830689419241_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=U7O6TFduKIIAX-nsUM6&_nc_ht=scontent.flpb2-1.fna&oh=00_AT83_1QYO1t5XZkBt1bx6cxQNh0LcCXkOlLrU522pTNAdg&oe=632DFC24",
      tamaniogrande: 3,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Baloo",
      caracteristica: "Cuidador, Jugueton, Comelon",
      genero: "Macho",
      color: "Negro",
      edad: "2 años",
      imagen:
          "https://scontent.flpb2-2.fna.fbcdn.net/v/t39.30808-6/305453054_5079855572119327_686631357370104684_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=J8mpkrkY2rMAX_NxnjS&_nc_ht=scontent.flpb2-2.fna&oh=00_AT-B_DiDCwMZRf7dX_L8tGhTyVPWEtKMQ9jPHdbM6qeRxg&oe=632CECFD",
      tamaniogrande: 2,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Dj",
      caracteristica: "Cuidador, Jugueton, Comelon",
      genero: "Macho",
      color: "Gringo",
      edad: "1 años",
      imagen:
          "https://scontent.flpb2-2.fna.fbcdn.net/v/t39.30808-6/307036308_5116219038482980_829757913239642763_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=OzRl8lGmQPwAX8xlZ9t&_nc_ht=scontent.flpb2-2.fna&oh=00_AT9TC0BgtGc-HM7KD-8NOjPp1S9GZVltDGvm67bf_wciaA&oe=632D9406",
      tamaniogrande: 2,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Copito",
      caracteristica: "Cuidador, Jugueton, Comelon",
      genero: "Macho",
      color: "Negro y cafe",
      edad: "3 meses",
      imagen:
          "https://scontent.flpb2-1.fna.fbcdn.net/v/t39.30808-6/306389074_5111603902277827_550574736074594504_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=MtI52Jed3OYAX_QC8yK&_nc_oc=AQk7bRH55POADR7zelpCfGLE1W2QQ42EKVHPwljtLQRakXzZCDWLo6rnm8quGjjeCOM&tn=St7BLE_wCe00v9m-&_nc_ht=scontent.flpb2-1.fna&oh=00_AT-CJgyAThzVGNW61fcRslQniyJevbr4gjAcvu0tMdTrYA&oe=632C7B24",
      tamaniogrande: 1,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Firu",
      caracteristica: "Comelon",
      genero: "Hembra",
      color: "Gringo",
      edad: "7 meses",
      imagen:
          "https://scontent.flpb2-2.fna.fbcdn.net/v/t39.30808-6/306674072_5108919245879626_5459308088247842639_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=j1BjeWl6aZMAX9rj3Nr&_nc_ht=scontent.flpb2-2.fna&oh=00_AT9BXRncOOKTIcY8riWhd18Af0m4qWyFgcjgKsZaleqjTw&oe=632D8B7F",
      tamaniogrande: 1,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Katy",
      caracteristica: "Juguetona, Cazadora",
      genero: "Hembra",
      color: "Blanca",
      edad: "5 meses",
      imagen:
          "https://scontent.flpb2-1.fna.fbcdn.net/v/t39.30808-6/306584938_5100904240014460_7581349191460983808_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=o3jBmPLjqEEAX-jts1y&tn=St7BLE_wCe00v9m-&_nc_ht=scontent.flpb2-1.fna&oh=00_AT9zXHgGmaLGKPNqxOA8FhfWRx0hGquV4ufYaMR4gmXl2A&oe=632DCD46",
      tamaniogrande: 1,
      is_favorite: true,
    ),
    Mascota(
      nombre: "Princesa",
      caracteristica: "Juguetona, Cazadora",
      genero: "Hembra",
      color: "Blanca",
      edad: "1 año",
      imagen:
          "https://scontent.flpb2-2.fna.fbcdn.net/v/t39.30808-6/302436910_5076759005762317_3493644842333943780_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=0r9Vmihbi48AX_hga4e&tn=St7BLE_wCe00v9m-&_nc_ht=scontent.flpb2-2.fna&oh=00_AT-cFYZld6FheNp7h4fJrEt0ncXG6BAgO7OlfnVautWInw&oe=632DBE6E",
      tamaniogrande: 1,
      is_favorite: true,
    ),
  ];

  bool get isfavorite => this.is_favorite;

  set isfavorite(bool value) => this.is_favorite = value;

  get getNombre => this.nombre;

  set setNombre(String nombre) => this.nombre = nombre;

  get getCaracteristica => this.caracteristica;

  set setCaracteristica(caracteristica) => this.caracteristica = caracteristica;

  get getGenero => this.genero;

  set setGenero(genero) => this.genero = genero;

  get getColor => this.color;

  set setColor(color) => this.color = color;

  get getEdad => this.edad;

  set setEdad(edad) => this.edad = edad;

  get getImagen => this.imagen;

  set setImagen(imagen) => this.imagen = imagen;

  get gettamaniogrande => this.tamaniogrande;

  set settamaniogrande(value) => this.tamaniogrande = value;
}
