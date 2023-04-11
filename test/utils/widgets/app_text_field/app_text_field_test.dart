import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trial/app/themes/app_colors.dart';
import 'package:trial/app/themes/app_text_theme.dart';
import 'package:trial/app/translations/app_translations.dart';
import 'package:trial/app/utils/widgets/app_text_field/app_text_field.dart';

void main() {
  group('AppTextField widget', () {
    late Widget testWidget;

    setUp(() {
      testWidget = MaterialApp(
        home: Scaffold(
          body: AppTextField(
            hintText: 'Enter your name',
            errorText: '',
            obscureText: false,
          ),
        ),
      );
    });

    testWidgets('should display the hint text', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      expect(find.text('Enter your name'), findsOneWidget);
    });

    testWidgets('should toggle obscure text', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      // Ensure the text field starts in non-obscured state
      expect(tester.widget<TextField>(find.byType(TextField)).obscureText, false);

      // Tap the obscure text toggle icon
      await tester.tap(find.byIcon(CupertinoIcons.eye));

      // Rebuild the widget tree
      await tester.pump();

      // Ensure the text field is now in obscured state
      expect(tester.widget<TextField>(find.byType(TextField)).obscureText, true);
    });

    testWidgets('should display error text when provided', (WidgetTester tester) async {
      const String errorText = 'Invalid input';
      testWidget = MaterialApp(
        home: Scaffold(
          body: AppTextField(
            hintText: 'Enter your name',
            errorText: errorText,
            obscureText: false,
          ),
        ),
      );

      await tester.pumpWidget(testWidget);

      expect(find.text(errorText), findsOneWidget);
    });

    testWidgets('should not display error text when not provided', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      expect(find.text(AppTranslationKey.noEmpty), findsNothing);
    });
  });
}
