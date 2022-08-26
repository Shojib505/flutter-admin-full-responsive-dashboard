import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0,
      selected: true,
      leading: SvgPicture.asset(
        svgSrc,
        height: 16,
        color: Colors.white54,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
