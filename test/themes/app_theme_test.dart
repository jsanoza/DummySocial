import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial/app/themes/app_colors.dart';
import 'package:trial/app/themes/app_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('AppThemes', () {
    test('should have the correct primary color', () {
      expect(AppThemes.themData.primaryColor, AppColors.kPrimaryColor);
    });

    test('should have the correct visual density', () {
      expect(AppThemes.themData.visualDensity, VisualDensity.adaptivePlatformDensity);
    });
  });
}
