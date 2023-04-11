import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trial/app/utils/widgets/app_button/base_button.dart';

void main() {
  group('BaseButton', () {
    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          home: BaseButton(
            child: Text('Button'),
            onPressed: () {},
          ),
        ),
      );
      expect(find.text('Button'), findsOneWidget);
    });

    testWidgets('calls onPressed when button is pressed',
        (WidgetTester tester) async {
      var pressed = false;
      await tester.pumpWidget(
        CupertinoApp(
          home: BaseButton(
            child: Text('Button'),
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      );
      await tester.tap(find.text('Button'));
      expect(pressed, true);
    });

    testWidgets('renders with color', (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          home: BaseButton(
            child: Text('Button'),
            onPressed: () {},
            color: CupertinoColors.activeBlue,
          ),
        ),
      );
      expect(
          (tester.widget(find.byType(CupertinoButton)) as CupertinoButton).color,
          CupertinoColors.activeBlue);
    });

    testWidgets('renders with disabled color', (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          home: BaseButton(
            child: Text('Button'),
            onPressed: null,
          ),
        ),
      );
      expect(
          (tester.widget(find.byType(CupertinoButton)) as CupertinoButton)
              .disabledColor,
          CupertinoColors.quaternarySystemFill);
    });
  });
}