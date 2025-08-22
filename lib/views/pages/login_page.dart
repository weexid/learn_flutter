import 'package:flutter/material.dart';
import 'package:learn_flutter/views/widgets/hero_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPw = TextEditingController();
  bool obscureText = true;

  // @override
  // void initState() {
  //   super.initState();
  //   print("Init State from Login Page");
  // }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HeroWidget(title: "Login"),
            SizedBox(height: 20),
            TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: "Email",
                hintStyle: TextStyle(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20, // tambah jarak kiri-kanan
                  vertical: 15, // tambah jarak atas-bawah
                ),
              ),
              onEditingComplete: () {
                setState(() {});
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: controllerPw,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: "Password",
                hintStyle: TextStyle(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20, // tambah jarak kiri-kanan
                  vertical: 15, // tambah jarak atas-bawah
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              onEditingComplete: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
