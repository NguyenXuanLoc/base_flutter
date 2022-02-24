import 'package:cuuhoxe/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final styleButtonPrimary = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralDark10;
    }
    return colorPrimaryBrand100;
  }),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonWhite = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled) ? colorNeutralDark40 : colorPrimaryBrand100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralDark20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed) ? colorNeutralDark5 : null;
  }),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonWhiteBorder = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: colorNeutralDark10, width: 2),
          )
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: colorPrimaryBrand100, width: 2),
          );
  }),
  backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled) ? colorNeutralDark40 : colorPrimaryBrand100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralDark20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed) ? colorNeutralDark5 : null;
  }),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonChip = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralDark10;
    }
    return colorPrimaryBrand5;
  }),
  foregroundColor: MaterialStateProperty.all<Color>(colorNeutralDark100),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonChipActive = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(color: colorPrimaryGreen100, width: 1.0),
    ),
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralDark10;
    }
    return colorPrimaryBrand5;
  }),
  foregroundColor: MaterialStateProperty.all<Color>(colorPrimaryBrand100),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleTextField = typoMediumTextRegular.copyWith(color: colorNeutralDark100);

final decorTextField = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorWhite, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorWhite, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorSemanticRed100, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorSemanticRed100, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
  hintStyle: typoNormalTextRegular.copyWith(color: colorNeutralDark40.withOpacity(0.4)),
  errorStyle: typoSmallTextRegular.copyWith(color: colorSemanticRed100),
  counterText: '',
  fillColor: Colors.white,
  filled: true,
);

final decorScreenContainerSelect = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  boxShadow: boxShadowSelectBox,
  color: colorWhite,
);

final decorScreenContainer = BoxDecoration(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  ),
  boxShadow: boxShadow,
  color: colorWhite,
);

final decorScreenContainerNoShadow = BoxDecoration(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  ),
  color: colorWhite,
);

final decorContainerBox = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  boxShadow: boxShadow,
  color: colorWhite,
);

final boxShadow = [
  BoxShadow(
    color: colorBlack.withOpacity(0.05),
    spreadRadius: 0,
    blurRadius: 10,
    offset: Offset(0, 0),
  ),
];

final boxShadowFocus = [
  BoxShadow(
    color: colorBlack.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 40,
    offset: Offset(0, 10),
  ),
];

final boxShadowSelectBox = [
  BoxShadow(
    color: colorBlack.withOpacity(0.2),
    spreadRadius: 0,
    blurRadius: 5,
    offset: Offset(0, 4),
  ),
];

final typoHeading2 = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w800,
  fontSize: 48,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoHeading4 = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 32,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoHeading5 = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 24,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoHeading6 = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 20,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoLargeTextBold = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 20,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoLargeTextRegular = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 20,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoMediumTextBold = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 18,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoMediumTextRegular = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 18,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoNormalTextBold = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 16,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoNormalTextRegular = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 16,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoNormalTextRegularNoSpacing = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: colorBlack,
);

final typoNormalTextThinRegular = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w200,
  fontSize: 16,
  color: colorBlack,
);

final typoSmallTextBold = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 14,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoSmallTextRegular = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoSmallTextRegularNoSpacing = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: colorBlack,
);

final typoExtraSmallTextBold = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 12,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoExtraSmallTextRegular = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 12,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoSuperSmallTextBold = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 10,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoSuperSmallTextRegular = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 10,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoSuperSmallTextRegularNoSpacing = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 10,
  color: colorBlack,
);
