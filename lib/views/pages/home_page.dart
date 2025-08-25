import 'package:flutter/material.dart';
import 'package:learn_flutter/data/constant.dart';
import 'package:learn_flutter/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: "Fluuter-Map"),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              child: Card(
                surfaceTintColor: Colors.teal,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("This is the Title", style: KTextStyle.titleStyle),
                      SizedBox(height: 10.0),
                      Text(
                        "Ini Data Card Gimana caranya buat agar besar?, Nice info gan",
                        style: KTextStyle.descStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
