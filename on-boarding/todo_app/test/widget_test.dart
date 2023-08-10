// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/screens/createTask.dart';

import 'package:todo_app/screens/listTask.dart';
import 'package:todo_app/screens/welcome.dart';

void main() {
  testWidgets('Creating task test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: CreateTask()));

    final input1 = find.byType(TextField).first;
    final input2 = find.byType(TextField).last;

    final button = find.byType(GestureDetector).last;
    expect(button, findsOneWidget);

    await tester.tap(button);

    // Rebuild the widget tree.
    await tester.pump();

    // Ensure that nothing happens if the title and description fields are empty.
    expect(find.text('Title'), findsNothing);

    // give input to 1st textField
    await tester.enterText(input1, "Title");

    // get date from the picker
    await tester.tap(find.byIcon(Icons.calendar_month));
    await tester.pumpAndSettle();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // give input to 2nd textField
    await tester.enterText(input2, "This is detail");

    // tap the button
    await tester.tap(button);
    await tester.pumpAndSettle();

    // check if values are displayed
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('This is detail'), findsOneWidget);


  // Onbording tester
  await tester.pumpWidget(MyApp());

    final button2 = find.widgetWithText(ElevatedButton, "Get Started");

    await tester.tap(button2);
    await tester.pumpAndSettle();

    expect(find.text('Tasks list'),findsOneWidget);

  });

}