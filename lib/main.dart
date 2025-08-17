import 'package:flutter/material.dart';
import 'package:learn_flutter/data/notifier.dart';
import 'package:learn_flutter/views/widget_tree.dart';

void main() {
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
          home: WidgetTree(),
        );
      },
    );
  }
}
