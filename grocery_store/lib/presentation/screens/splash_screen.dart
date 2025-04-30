import 'package:flutter/material.dart';
import '../../theme/exported_theme_file.dart';
import '../../theme/app_dimensions.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/nectarSplash.png',
              width: Dimensions.splashImageWidth, //268,
              height: Dimensions.splashImageHeight, //64,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
