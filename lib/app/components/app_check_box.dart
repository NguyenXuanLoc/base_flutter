import 'package:cuuhoxe/app/theme/app_styles.dart';
import 'package:cuuhoxe/app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox(
      {required this.value, required this.onChanged, this.avatar = "", this.label, this.isOnLeft = true, Key? key})
      : super(key: key);
  final bool value;
  final String? avatar;
  final String? label;
  final bool isOnLeft;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          if (isOnLeft) ...[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: value ? colorPrimaryBrand100 : colorNeutralDark40, width: 2),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value ? colorPrimaryBrand100 : colorWhite,
                ),
                width: 16,
                height: 16,
                margin: EdgeInsets.all(2),
              ),
            ),
          ],
          Visibility(visible: avatar!.isNotEmpty, child: Image.asset(avatar ?? '')),
          SizedBox(
            width: 8,
          ),
          Text(
            label ?? '',
            style: typoNormalTextRegularNoSpacing,
          ),
          if (!isOnLeft) ...[
            Spacer(),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: value ? colorPrimaryBrand100 : colorNeutralDark40, width: 2),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value ? colorPrimaryBrand100 : colorWhite,
                ),
                width: 16,
                height: 16,
                margin: EdgeInsets.all(2),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
