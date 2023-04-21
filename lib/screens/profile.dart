import 'package:books_and_details/services/database.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        centerTitle: true,
        title: Text('Profile', style: TextStyle(color: color.background)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: CircleAvatar(
            maxRadius: 75,
            backgroundImage: NetworkImage(user.photoURL!),
          )),
          const SizedBox(height: 50),
          Center(
            child: Column(
              children: [
                Text(user.displayName!, style: const TextStyle(fontSize: 20)),
                Text(user.email!, style: const TextStyle(fontSize: 20)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
