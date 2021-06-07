import 'package:auto_animated/auto_animated.dart';

class Helper {

  static LiveOptions get options => LiveOptions(
    delay: Duration(seconds: 0),
    showItemInterval: Duration(milliseconds: 100),
    showItemDuration: Duration(milliseconds: 250),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );
}