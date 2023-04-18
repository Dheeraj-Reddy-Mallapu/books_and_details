import 'package:books_and_details/services/google_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Books and Details',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 300,
            width: 300,
            child: SvgPicture.asset('assets/logo.svg'),
          ),
          const SizedBox(height: 25),
          ElevatedButton.icon(
            label: const Text('SignIn'),
            icon: SvgPicture.asset('assets/google.svg', height: 20),
            onPressed: () async {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              await provider.googleLogin();
            },
          ),
        ],
      ),
    );
  }
}
