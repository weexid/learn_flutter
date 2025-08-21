import 'package:flutter/material.dart';
import 'package:learn_flutter/data/notifier.dart';
import 'package:learn_flutter/views/pages/welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomePage();
                    },
                  ),
                );
              },
              child: Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
