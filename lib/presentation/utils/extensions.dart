import 'dart:math';

import 'package:flutter/material.dart';

import 'app_theme.dart';

extension TextStyling on TextStyle {
  TextStyle get bold {
    return this.copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle get normal {
    return this.copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get light {
    return this.copyWith(fontWeight: FontWeight.w100);
  }

  TextStyle get withDeepBlue {
    return this.copyWith(color: AppTheme.deepBlue);
  }

  TextStyle get withGrey {
    return this.copyWith(color: AppTheme.grey);
  }

  TextStyle get withWhite {
    return this.copyWith(color: Colors.white);
  }

  TextStyle get withOrange {
    return this.copyWith(color: AppTheme.deepOrange);
  }

  TextStyle get moreLineSpace {
    return this.copyWith(height: 1.5);
  }
}

extension Ripple on Widget {
  Widget addRipple({required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withOpacity(0.1),
        highlightColor: Colors.white.withOpacity(0.1),
        child: this,
      ),
    );
  }
}

extension Shuffle<T> on List<T> {
  List<T> get shuffleList {
    var items = this;
    var random = new Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {

      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }
}