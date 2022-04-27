import 'dart:ui';

import 'package:flutter/material.dart';

class BlurEffect extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadiusValue;
  BlurEffect({
    Key? key,
    required this.child,
    this.color = Colors.white,
    this.borderRadiusValue = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return child;
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadiusValue),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
          ),
          child: child,
        ),
      ),
    );
  }
}
