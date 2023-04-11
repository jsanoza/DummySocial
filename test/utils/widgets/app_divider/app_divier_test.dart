import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trial/app/themes/app_colors.dart';
import 'package:trial/app/utils/widgets/app_divider/app_divider.dart';

void main() {
  group('AppDivider', () {
    testWidgets('should render with default values', (WidgetTester tester) async {
      final divider = AppDivider(
        color: AppColors.colorDivider,
        height: 1.5,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: divider,
          ),
        ),
      );

      expect(divider.color, equals(AppColors.colorDivider));
      expect(divider.height, equals(1.5));
    });

    testWidgets('should render with custom values', (WidgetTester tester) async {
      final divider = const AppDivider(
        color: Colors.green,
        height: 3.0,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: divider,
          ),
        ),
      );
      expect(divider.color, equals(Colors.green));
      expect(divider.height, equals(3.0));
    });
  });
}
