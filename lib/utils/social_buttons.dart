import '../utils/mytheme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButtons extends StatelessWidget {
  final Function() ontap;
  final String svgicon;
  final String name;
  final Color backcolor;
  const SocialButtons(
      {Key? key,
      required this.ontap,
      required this.svgicon,
      required this.name,
      required this.backcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: backcolor == MyTheme.redLight
                ? MyTheme.redBorder
                : MyTheme.blueBorder,
            width: 0.2),
        color: backcolor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Row(
            children: [
              SvgPicture.asset(svgicon),
              const SizedBox(width: 8),
              Text(
                name,
                style: const TextStyle(
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
