import 'dart:ui';

import 'package:flutter/material.dart';

class FilterWrapper extends StatelessWidget {
  final double blurAmount;
  final Widget? child;

  const FilterWrapper({
    Key? key,
    this.blurAmount = 0.0,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (blurAmount == 0.0) {
      return Container(
        child: child,
      );
    }

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
      child: child,
    );
  }
}
