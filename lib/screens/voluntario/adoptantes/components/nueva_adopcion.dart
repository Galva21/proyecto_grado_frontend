import 'package:flutter/material.dart';
import 'package:pet_app/provider/user_provider.dart';
import 'package:pet_app/screens/voluntario/adoptantes/components/get_pet_adopcion.dart';
import 'package:provider/provider.dart';

class NuevaAdopcion extends StatefulWidget {
  final String id;
  const NuevaAdopcion({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<NuevaAdopcion> createState() => _NuevaAdopcionState();
}

class _NuevaAdopcionState extends State<NuevaAdopcion> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   backgroundColor: appBarColor,
          //   pinned: true,
          //   snap: true,
          //   floating: true,
          //   iconTheme: IconThemeData(color: labelColor),
          //   title: getAppBar(),
          //   centerTitle: true,
          // ),
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
            GetPetAdopcion(),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Center(
                child: Text("Boton y datos de adopcion"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
