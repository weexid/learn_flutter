import 'package:flutter/material.dart';
import 'package:learn_flutter/views/widget_tree.dart';
import 'package:learn_flutter/widgets/navbar_widget.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: WidgetTree(),
    );
  }
}
