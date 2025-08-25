import 'package:flutter/material.dart';
import 'package:learn_flutter/data/constant.dart';
import 'package:learn_flutter/data/notifier.dart';
import 'package:learn_flutter/views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool(KConstant.themeModeKey) ?? false;

  selectedPageNotifier = ValueNotifier<int>(0);
  isDarkModeNotifier = ValueNotifier<bool>(isDark);

  runApp(const MyApp());
}

// Material App
// Scafold
// App Bar / App title
// Bottom Navigation for set state

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // _loadTheme();
    super.initState();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(KConstant.themeModeKey) ?? false;
    isDarkModeNotifier.value = isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: value ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}
