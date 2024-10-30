import 'package:dio_lab_flutter_dio_podcast/src/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            SvgPicture.asset("assets/images/logo.svg", width: 40, height: 40)
          ],
        ),
        const Row(
          children: [
            Text(
              "Dio",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Cast",
              style: TextStyle(
                color: CustomColor.pink700,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
