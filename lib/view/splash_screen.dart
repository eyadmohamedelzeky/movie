import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie__app/view/home_screen.dart';
import 'package:movie__app/widgets/custom_text.dart';

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
            CircleAvatar(
              maxRadius: 40,
              backgroundImage: ExactAssetImage('assets/icons/movies.png'),
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
                text: 'Movie App', fontSize: 40, fontWeight: FontWeight.bold),
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
      Duration(seconds: 5),
       () => Get.off(()=>HomeScreen())
      // Navigator.of(context).push(DialogRoute(
      //     context: context,
      //     builder: (_) {
      //       return HomeScreen();
      //     })),
    );
  }
}
