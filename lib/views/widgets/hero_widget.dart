import 'package:flutter/material.dart';
import 'package:learn_flutter/data/constant.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: 'hero1',
          child: Image.asset(
            'assets/images/img02.png',
            color: Colors.teal,
            colorBlendMode: BlendMode.multiply,
          ),
        ),
        Text(title, style: KTextStyle.bannerTextStyle),
      ],
    );
  }
}
