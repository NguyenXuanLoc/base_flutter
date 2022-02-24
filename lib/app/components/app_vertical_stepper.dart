import 'package:cuuhoxe/app/theme/app_styles.dart';
import 'package:cuuhoxe/app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppVerticalStepper extends StatelessWidget {
  const AppVerticalStepper({required this.stepChildren, required this.currentStep, Key? key}) : super(key: key);
  final List<Widget> stepChildren;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: stepChildren.map((element) {
        final index = stepChildren.indexOf(element);
        return Stack(
          children: [
            Positioned(
              left: 15,
              bottom: 0,
              top: 0,
              child: Container(
                width: 2,
                color: currentStep >= index ? colorPrimaryBrand100 : colorNeutralDark20,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: currentStep >= index ? colorPrimaryBrand100 : colorNeutralDark20, width: 3),
                    color: currentStep >= index ? colorPrimaryBrand10 : colorWhite,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: typoSmallTextBold.copyWith(color: currentStep >= index ? colorPrimaryBrand100 : colorNeutralDark20),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(child: element),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
