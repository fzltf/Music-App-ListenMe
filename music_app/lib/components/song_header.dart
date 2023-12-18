import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SongHeader extends StatelessWidget {
  const SongHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/logo.svg",
          width: 40,
        ),
        SizedBox(width: 10),
        Text(
          "Listen Me!",
          style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Roboto"
          ),
        ),
      ],
    );
  }
}
