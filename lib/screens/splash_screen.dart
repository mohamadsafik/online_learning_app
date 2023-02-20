import 'dart:async';

import 'package:online_learning_app/theme.dart';
import 'package:online_learning_app/widgets/custom_splash_widget.dart';
import 'package:online_learning_app/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(
        seconds: 5,
      ),
      () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSplashScreen(
      logo: 'assets/logo.png',
      size: 120,
      // title: 'Ini Title',
      spacing: 10,
      fontWeight: semibold,
      fontSize: 22,
      backgroundColor: kBackgroundColor,
    );
  }
}
