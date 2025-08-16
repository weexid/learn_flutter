import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 235, 3, 177),
        ),
      ),
      home: const MyHomePage(title: 'This app run with IOS Simulator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: Icon(
          Icons.notification_add_outlined,
          color: const Color.fromARGB(255, 51, 4, 222),
        ),
      ),
      body: Stack(
        children: [
          // Image.asset(
          //   'assets/images/img01.jpg',
          //   fit: BoxFit.cover,
          //   height: 300.0,
          // ),
          SizedBox(
            height: 300.0,
            child: Center(
              child: Text(
                "Helo World",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_2_outlined, color: Colors.white),
            title: Text(
              "Helo This is tile, i love flutter very much",
              style: TextStyle(color: Colors.white),
            ),
            tileColor: Colors.blueAccent,
            trailing: Text(
              "Hi",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            onTap: () {
              print("Helo from another world");
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("You have pressed the floating action button");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
