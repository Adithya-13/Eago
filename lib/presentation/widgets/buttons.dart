
import 'package:auto_size_text/auto_size_text.dart';
import 'package:eago_app/presentation/utils/utils.dart';
import 'package:flutter/material.dart';

class RippleButton extends StatelessWidget {
  final String text;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final VoidCallback onTap;

  const RippleButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.prefixWidget,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.deepOrange,
        boxShadow: AppTheme.getShadow(AppTheme.deepOrange),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              prefixWidget ?? Container(),
              AutoSizeText(
                text,
                style: AppTheme.text2,
                textAlign: TextAlign.center,
                minFontSize: 8,
                maxLines: 1,
              ),
              suffixWidget ?? Container(),
            ],
          )).addRipple(onTap: onTap),
    );
  }
}