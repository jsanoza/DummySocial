import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trial/app/utils/widgets/app_bar/custom_app_bar.dart';

void main() {
  testWidgets('CustomAppBar should render correctly', (WidgetTester tester) async {
    final appBar = CustomAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text('CustomAppBar'),
      centerTitle: false,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: appBar,
          body: Container(),
        ),
      ),
    );

    expect(appBar.backgroundColor, equals(Colors.transparent));
    expect(appBar.elevation, equals(0.0));
    expect(appBar.title, isA<Text>());
    expect((appBar.title as Text).data, equals('CustomAppBar'));
    expect(appBar.centerTitle, isFalse);
  });
}
