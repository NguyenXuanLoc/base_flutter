import 'package:cuuhoxe/app/theme/app_styles.dart';
import 'package:cuuhoxe/app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppHorizontalStepper extends StatelessWidget {
  const AppHorizontalStepper({required this.stepCount, required this.currentStep, Key? key}) : super(key: key);
  final int stepCount;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i <= stepCount; i++)
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 2,
                  color: i <= currentStep ? colorPrimaryBrand100 : colorNeutralDark20,
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < stepCount; i++)
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: currentStep >= i ? colorPrimaryBrand100 : colorNeutralDark20, width: 3),
                  color: currentStep >= i ? colorPrimaryBrand10 : colorWhite,
                ),
                child: Center(
                  child: i >= currentStep
                      ? Text(
                          '${i + 1}',
                          style: typoSmallTextBold.copyWith(color: currentStep >= i ? colorPrimaryBrand100 : colorNeutralDark20),
                        )
                      : Icon(Icons.check, color: colorPrimaryBrand100),
                ),
              )
          ],
        ),
      ],
    );
  }
}
