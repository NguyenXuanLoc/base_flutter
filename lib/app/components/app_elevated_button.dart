import 'package:cuuhoxe/app/theme/colors.dart';
import 'package:flutter/material.dart';

enum AppElevatedButtonState {
  active,
  inactive,
  loading,
}

class AppElevatedButton extends StatelessWidget {
  final String? buttonTitle;
  final Color? mainColor;
  final VoidCallback? onPressed;
  final AppElevatedButtonState state;

  AppElevatedButton({this.buttonTitle, this.onPressed, this.mainColor, this.state = AppElevatedButtonState.active});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: state == AppElevatedButtonState.active ? onPressed : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return mainColor ?? colorPrimaryBrand100;
            if (states.contains(MaterialState.disabled)) return colorNeutralDark10;
            return mainColor ?? colorPrimaryBrand100;
          },
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            );
          },
        ),
      ),
      child: Container(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: state == AppElevatedButtonState.loading ? 16.0 : 0.0,
              width: state == AppElevatedButtonState.loading ? 16.0 : 0.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).disabledColor,
                ),
                strokeWidth: 2,
              ),
            ),
            SizedBox(
              width: state == AppElevatedButtonState.loading ? 8.0 : 0.0,
            ),
            Text(
              buttonTitle ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: state == AppElevatedButtonState.active ? Colors.white : Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
