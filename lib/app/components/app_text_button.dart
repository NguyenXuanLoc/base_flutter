import 'package:cuuhoxe/app/theme/app_styles.dart';
import 'package:cuuhoxe/app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String? buttonTitle;
  final Color? color;
  final VoidCallback? onPressed;

  AppTextButton({this.buttonTitle, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonTitle ?? '',
        style: typoNormalTextBold.copyWith(color: color ?? colorPrimaryBrand100),
      ),
    );
  }
}
