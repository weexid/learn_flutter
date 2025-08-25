import 'package:flutter/material.dart';
import 'package:learn_flutter/data/constant.dart';
import 'package:learn_flutter/data/notifier.dart';
import 'package:learn_flutter/views/pages/home_page.dart';
import 'package:learn_flutter/views/pages/profile_page.dart';
import 'package:learn_flutter/views/pages/report_page.dart';
import 'package:learn_flutter/views/pages/setting_page.dart';
import 'package:learn_flutter/views/pages/settings_page.dart';
import 'package:learn_flutter/views/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstant.themeModeKey,
                !isDarkModeNotifier.value,
              );
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
