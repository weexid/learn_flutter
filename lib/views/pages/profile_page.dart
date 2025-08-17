import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked1 = false; // Variabel untuk checkbox pertama
  bool? isChecked2 = false; // Variabel untuk checkbox kedua
  bool? isChecked = false;
  bool isSwitch = false;
  double slider = 0.0;

  String get textToShow {
    if (isChecked == true) {
      return "Checked";
    } else if (isChecked == false) {
      return "Unchecked";
    }
    return "N/A";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder()),
              onEditingComplete: () {
                setState(() {});
              },
            ),
            Text(controller.text),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Pilihan Checkbox pertama
                InkWell(
                  onTap: () {
                    setState(() {
                      // Logika untuk mengubah status checkbox saat label diklik
                      if (isChecked1 == true) {
                        isChecked1 = false;
                      } else {
                        isChecked1 = true;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        tristate: true,
                        value: isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked1 = value;
                          });
                        },
                      ),
                      Text("Opsi 1"), // Label untuk checkbox pertama
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (isChecked2 == true) {
                        isChecked2 = false;
                      } else {
                        isChecked2 = true;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        tristate: true,
                        value: isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value;
                          });
                        },
                      ),
                      Text("Opsi 2"), // Label untuk checkbox kedua
                    ],
                  ),
                ),
              ],
            ),

            Checkbox(
              tristate: true,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            CheckboxListTile.adaptive(
              tristate: true,
              title: Text("Good mood"),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            Text(textToShow),
            Switch(
              value: isSwitch,
              onChanged: (value) => setState(() {
                isSwitch = value;
              }),
            ),
            SwitchListTile.adaptive(
              title: Text("Switch me"),
              value: isSwitch,
              onChanged: (value) => setState(() {
                isSwitch = value;
              }),
            ),
            Slider.adaptive(
              value: slider,
              max: 100,
              divisions: 20,
              onChanged: (value) {
                setState(() {
                  slider = value;
                });
              },
            ),
            Image.asset('assets/images/img01.jpg'),
            Image.asset('assets/images/img01.jpg'),
            Image.asset('assets/images/img01.jpg'),
            Image.asset('assets/images/img01.jpg'),
          ],
        ),
      ),
    );
  }
}
