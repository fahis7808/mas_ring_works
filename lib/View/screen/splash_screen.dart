import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/authentication/mobile_number_page.dart';
import 'package:mas_ring_works/View/screen/dashboard/dashboard_screen.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:provider/provider.dart';

import '../../provider/authentication_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> _initializeApp(BuildContext context,AuthenticationProvider data) async {
    // final authProvider =
    // Provider.of<AuthenticationProvider>(context);
    await Future.delayed(const Duration(seconds: 1));
      print(data.isSignedIn);
    if (data.isSignedIn) {
    await data.getDataFromSP().whenComplete(() =>   Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const DashboardPage())));
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MobileNumberPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthenticationProvider>(
      create: (context)=> AuthenticationProvider(),
      child: Consumer<AuthenticationProvider>(
        builder: (context,data,_) {
          print(data.isSignedIn);
          return Scaffold(
            body: Center(
              child: FutureBuilder(
                  future: _initializeApp(context,data),
                  builder: (context, snapshot) {
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mass \nRing Works",
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
      ),
    );
  }
}
