import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trial/app/themes/app_colors.dart';


void main() {
  group('AppColors', () {
    test('kPrimaryColor should have correct values', () {
      final swatch = AppColors.kPrimaryColor;

      expect(swatch[50], Color(0x88FFC7FF));
      expect(swatch[100], Color(0xFFFFC7FF));
      expect(swatch[200], Color(0xFFF1A6AA));
      expect(swatch[300], Color(0xFFFF99E0));
      expect(swatch[400], Color(0xFFFF6DA3));
      expect(swatch[500], Color(0xFFEE4463));
      expect(swatch[600], Color(0xFFEE4463));
      expect(swatch[700], Color(0xFFEE4463));
      expect(swatch[800], Color(0xFFEE4463));
      expect(swatch[900], Color(0xFF895E6B));
    });

    test('white should have correct value', () {
      expect(AppColors.white, Colors.white);
    });

    test('black should have correct value', () {
      expect(AppColors.black, Colors.black);
    });

    test('transparent should have correct value', () {
      expect(AppColors.transparent, Color(0x00000000));
    });

    test('green should have correct value', () {
      expect(AppColors.green, Color(0xFF43A838));
    });

    test('red should have correct value', () {
      expect(AppColors.red, Color(0xFFFF3B3B));
    });

    test('gray should have correct value', () {
      expect(AppColors.gray, Color(0xFFAAAAAA));
    });

    test('lightGray should have correct value', () {
      expect(AppColors.lightGray, Color(0xFF909296));
    });

    test('colorDivider should have correct value', () {
      expect(AppColors.colorDivider, Color(0xFFEBEBEB));
    });

    test('neutral6 should have correct value', () {
      expect(AppColors.neutral6, Color(0xFFF1F2F9));
    });

    test('neutral3 should have correct value', () {
      expect(AppColors.neutral3, Color(0xFFADAFC5));
    });
  });
}
