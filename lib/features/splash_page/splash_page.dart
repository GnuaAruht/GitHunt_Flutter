import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:githunt_flutter/core/const/route_const.dart';

const _logoSize = 140.0;
const _animationDuration = Duration(milliseconds: 400);

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {

  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.forward();
      Future.delayed(_animationDuration + const Duration(milliseconds: 200))
          .whenComplete(() => context.go(RouteConst.mainPath));
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return FadeTransition(
                opacity: controller,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: _logoSize,
                      height: _logoSize,
                    ),
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'GitHunt',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Most starred projects on GitHub',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
