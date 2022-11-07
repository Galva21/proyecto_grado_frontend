import 'package:flutter/material.dart';
import 'package:pet_app/screens/administrador/home/voluntarios.dart';
import 'package:pet_app/screens/administrador/perfil/perfil.dart';
import 'package:pet_app/screens/components/bottombar_item.dart';
import 'package:pet_app/utils/color.dart';

class RootAdministrador extends StatefulWidget {
  const RootAdministrador({Key? key}) : super(key: key);

  @override
  State<RootAdministrador> createState() => _RootAdministradorState();
}

class _RootAdministradorState extends State<RootAdministrador>
    with TickerProviderStateMixin {
  int activeTab = 0;
  List barItems = [
    {
      "icon": "assets/icons/home-border.svg",
      "active_icon": "assets/icons/home.svg",
      "page": VoluntariosPage(),
      "title": "Home"
    },
    {
      "icon": "assets/icons/setting-border.svg",
      "active_icon": "assets/icons/setting.svg",
      "page": PerfilAdministrador(),
      "title": ""
    },
  ];
//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      activeTab = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: getBarPage(),
      // bottomNavigationBar: getBottomBar1()
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget getBarPage() {
    return IndexedStack(
      index: activeTab,
      children: List.generate(
        barItems.length,
        (index) => animatedPage(
          barItems[index]["page"],
        ),
      ),
    );
  }

  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.3),
              blurRadius: 0.5,
              spreadRadius: 0.5,
              offset: Offset(0, 1),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          barItems.length,
          (index) => BottomBarItem(
            activeTab == index
                ? barItems[index]["active_icon"]
                : barItems[index]["icon"],
            "",
            isActive: activeTab == index,
            activeColor: primary,
            onTap: () {
              onPageChanged(index);
            },
          ),
        ),
      ),
    );
  }
}
