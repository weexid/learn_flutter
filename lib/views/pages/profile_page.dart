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
  String? dropdownval = "menu-1";

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
            DropdownButton(
              value: dropdownval,
              items: [
                DropdownMenuItem(value: "menu-1", child: Text("Menu 1")),
                DropdownMenuItem(value: "menu-2", child: Text("Menu 2")),
                DropdownMenuItem(value: "menu-3", child: Text("Menu 3")),
              ],
              onChanged: (String? value) {
                setState(() {
                  dropdownval = value;
                });
                print("The dropdown value is $dropdownval");
              },
            ),
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
            GestureDetector(
              onTap: () {
                print("This image taped");
              },
              child: Image.asset('assets/images/img01.jpg'),
            ),
            SizedBox(height: 15.0),
            InkWell(
              splashColor: Colors.teal,
              onTap: () {
                print("This is new one !");
              },
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.white12,
              ),
            ),
            // buttons
            ElevatedButton(
              onPressed: () {
                print("this button (styled elevate)");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
              ),
              child: Text("Click me !"),
            ),
            ElevatedButton(
              onPressed: () {
                print("this button (unstyled elevate)");
              },
              child: Text("Click me !"),
            ),
            FilledButton(onPressed: () {}, child: Text("Filled Button")),
            TextButton(onPressed: () {}, child: Text("Text Button")),
            OutlinedButton(onPressed: () {}, child: Text("Outlined Button")),
            CloseButton(),
            BackButton(),
          ],
        ),
      ),
    );
  }
}
