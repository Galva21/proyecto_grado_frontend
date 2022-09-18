import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/theme/color.dart';

class UserSimulatorItem extends StatelessWidget {
  UserSimulatorItem(
      {Key? key,
      required this.data,
      this.selected = false,
      this.onTap,
      required this.image})
      : super(key: key);
  final data;
  final bool selected;
  final GestureTapCallback? onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          margin: EdgeInsets.only(right: 10),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: selected ? secondary : cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: .5,
                blurRadius: .5,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                Container(
                  child: Image.asset(
                    image,
                    height: double.parse(data["icon"].toString()),
                  ),
                ),
                Spacer(),
                Container(
                  child: Text(
                    data["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: selected ? Colors.white : textColor),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
