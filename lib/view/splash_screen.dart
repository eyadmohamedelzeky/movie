import 'package:flutter/material.dart';
import 'package:movie__app/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigatetohome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Movie App",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CircularProgressIndicator(
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  void navigatetohome() {
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.of(context).push(DialogRoute(
          context: context,
          builder: (_) {
            return HomeScreen();
          })),
    );
  }
}