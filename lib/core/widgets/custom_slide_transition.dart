import 'package:flutter/material.dart';

class CustomSlidTransition extends StatefulWidget {
  const CustomSlidTransition({super.key, required this.animation, this.child});

  final Animation<double> animation;
  final Widget? child;

  @override
  State<CustomSlidTransition> createState() => _CustomSlidTransitionState();
}

class _CustomSlidTransitionState extends State<CustomSlidTransition> {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(widget.animation),
      child: widget.child,
    );
  }
}
