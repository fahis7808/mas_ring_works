import 'package:flutter/material.dart';
import 'package:mas_ring_works/constants/app_colors.dart';

import 'authentication/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> _initializeApp(BuildContext context) async {
    // final authProvider =
    // Provider.of<AuthenticationProvider>(context, listen: false);
    await Future.delayed(const Duration(seconds: 1));
    // if (authProvider.isSignedIn) {
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => const Dashboard()));
    // } else {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: _initializeApp(context),
            builder: (context, snapshot) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Business \nManagement",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryColor,
                        fontSize: 50),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
