
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/ui/area_list.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int selectedIndex = 0;
 // final userDataBox = Boxes.getUserData().get("userInfo");

  @override
  void initState() {
    // final box = Boxes.getOrder();

    // if (box.isNotEmpty && userDataBox != null) {
    //   if (box.values.first.userId != userDataBox!.userId ||
    //       box.values.first.orderDate !=
    //           DateFormat('yyyy-MM-dd').format(DateTime.now())) {
    //     Boxes.getOrder().clear();
    //     Boxes.getUserData().clear();
    //   }
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
          duration: 2000,
          splash: Image.asset('assets/images/Transcom.png'),
          nextScreen: AreaListScreen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
    );
  }
}