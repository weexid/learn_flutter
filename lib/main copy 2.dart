import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Ada 3 jenis state dalam widget
// 1. stateful -> stateful widget memungkinkan untuk aplikasi melakukan refresh
// 2. stateless -> stateless widget tidak bisa
// 3. setstate -> masih belum tau

String title = "Amazing App";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 246, 229, 0),
        ),
        brightness: Brightness.light,
      ),
      home: MyHomePage(),
    );
  }
}

// buat statefull widget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // buat variable disini tidak akan di rubah saat di rebuild
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: currentIndex == 0
          ? Center(child: Text("1"))
          : Center(child: Text("2")),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
          NavigationDestination(icon: Icon(Icons.person), label: "User"),
        ],
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
      ),
    );
  }
}
