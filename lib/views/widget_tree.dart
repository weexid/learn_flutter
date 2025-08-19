import 'package:flutter/material.dart';
import 'package:learn_flutter/data/notifier.dart';
import 'package:learn_flutter/views/pages/home_page.dart';
import 'package:learn_flutter/views/pages/profile_page.dart';
import 'package:learn_flutter/views/pages/report_page.dart';
import 'package:learn_flutter/views/pages/setting_page.dart';
import 'package:learn_flutter/views/pages/settings_page.dart';
import 'package:learn_flutter/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), ProfilePage(), ReportPage(), SettingPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi Mom 🔥"),
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, value, child) {
                return Icon(value ? Icons.dark_mode : Icons.light_mode);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: "Settings");
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      bottomNavigationBar: NavbarWidget(),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (BuildContext context, dynamic selectedValue, Widget? child) {
          return pages.elementAt(selectedValue);
        },
      ),
    );
  }
}
