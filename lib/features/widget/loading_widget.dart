import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {

  factory LoadingWidget.small() => const LoadingWidget._(loadingSize: 68.0);
  factory LoadingWidget.medium() => const LoadingWidget._(loadingSize: 80.0);

  final double loadingSize;

  const LoadingWidget._({super.key, required this.loadingSize});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {

  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    controller..forward()..repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return RotationTransition(
      turns: controller,
      child: Image.asset(
        brightness == Brightness.light
            ? 'assets/loading_dark.png'
            : 'assets/loading_light.png',
        width: widget.loadingSize,
        height: widget.loadingSize,
        fit: BoxFit.fill,
      ),
    );
  }
}
