import 'package:flutter/material.dart';
import 'package:tiakbookapp/src/utils/mediaqueries.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: FadeTransition(
          opacity: _animation,
          child: Center(
              child: Image.asset(
            "assets/images/tiakBook.png",
            width: vw(context, 0.5),
          )),
        ),
      ),
    );
  }
}
