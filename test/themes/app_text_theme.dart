import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:trial/app/themes/app_colors.dart';
import 'package:trial/app/themes/app_text_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('AppTextStyles', () {
    test('base text style', () {
      expect(AppTextStyles.base, isA<TextStyle>());
      expect(AppTextStyles.base.fontSize, equals(16));
      expect(AppTextStyles.base.fontWeight, equals(FontWeight.normal));
      expect(AppTextStyles.base.color, equals(AppColors.kPrimaryColor));
    });

    test('AppFontWeight extensions', () {
      final textStyle = TextStyle();
      expect(textStyle.w100.fontWeight, equals(FontWeight.w100));
      expect(textStyle.w200.fontWeight, equals(FontWeight.w200));
      expect(textStyle.w300.fontWeight, equals(FontWeight.w300));
      expect(textStyle.w400.fontWeight, equals(FontWeight.w400));
      expect(textStyle.w500.fontWeight, equals(FontWeight.w500));
      expect(textStyle.w600.fontWeight, equals(FontWeight.w600));
      expect(textStyle.w700.fontWeight, equals(FontWeight.w700));
      expect(textStyle.w800.fontWeight, equals(FontWeight.w800));
      expect(textStyle.w900.fontWeight, equals(FontWeight.w900));
    });

    test('AppFontSize extensions', () {
      final textStyle = TextStyle();
      expect(textStyle.s10.fontSize, equals(10));
      expect(textStyle.s12.fontSize, equals(12));
      expect(textStyle.s14.fontSize, equals(14));
      expect(textStyle.s16.fontSize, equals(16));
      expect(textStyle.s18.fontSize, equals(18));
      expect(textStyle.s20.fontSize, equals(20));
      expect(textStyle.s24.fontSize, equals(24));
      expect(textStyle.s32.fontSize, equals(32));
      expect(textStyle.s40.fontSize, equals(40));
      expect(textStyle.s48.fontSize, equals(48));
    });

    test('AppFontColor extensions', () {
      final textStyle = TextStyle();
      expect(textStyle.whiteColor.color, equals(AppColors.white));
      expect(textStyle.blackColor.color, equals(AppColors.black));
      expect(textStyle.kPrimaryColor.color, equals(AppColors.kPrimaryColor));
      expect(textStyle.neutral3Color.color, equals(AppColors.neutral3));
      expect(textStyle.redColor.color, equals(AppColors.red));
    });

    test('AppFontStyle extensions', () {
      final textStyle = TextStyle();
      expect(textStyle.italic.fontStyle, equals(FontStyle.italic));
    });

    test('AppFontDecoration extensions', () {
      final textStyle = TextStyle();
      expect(textStyle.overline.decoration, equals(TextDecoration.overline));
      expect(textStyle.underline.decoration, equals(TextDecoration.underline));
      expect(textStyle.noneDecoration.decoration, equals(TextDecoration.none));
      expect(textStyle.lineThrough.decoration, equals(TextDecoration.lineThrough));
    });
  });
}
