import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trial/app/themes/app_colors.dart';
import 'package:trial/app/themes/app_text_theme.dart';
import 'package:trial/app/utils/loading.dart';

void main() {
  group('Loading Widget', () {
    testWidgets('should display default loading widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Loading(),
        ),
      );

      expect(find.byType(SpinKitChasingDots), findsOneWidget);
      expect(find.text(''), findsNothing);
    });

    testWidgets('should display loading widget with title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Loading(
            title: 'Loading...',
          ),
        ),
      );

      expect(find.byType(SpinKitChasingDots), findsOneWidget);
      expect(find.text('Loading...'), findsOneWidget);
    });

    testWidgets('should display dual ring loading widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Loading(
            loadingType: LoadingType.dualRing,
          ),
        ),
      );

      expect(find.byType(SpinKitDualRing), findsOneWidget);
      expect(find.text(''), findsNothing);
    });

    testWidgets('should display double bounce loading widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Loading(
            loadingType: LoadingType.doubleBounce,
          ),
        ),
      );

      expect(find.byType(SpinKitDoubleBounce), findsOneWidget);
      expect(find.text(''), findsNothing);
    });

    testWidgets('should display fading circle loading widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Loading(
            loadingType: LoadingType.fadingCircle,
          ),
        ),
      );

      expect(find.byType(SpinKitFadingCircle), findsOneWidget);
      expect(find.text(''), findsNothing);
    });

    testWidgets('should display loading widget with all properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Loading(
            title: 'Loading...',
            loadingType: LoadingType.dualRing,
          ),
        ),
      );

      expect(find.byType(SpinKitDualRing), findsOneWidget);
      expect(find.text('Loading...'), findsOneWidget);
      expect(find.byType(Positioned), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text('Loading...'), findsOneWidget);
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
