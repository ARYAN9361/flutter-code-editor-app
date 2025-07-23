import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart';

void main() {
  testWidgets('App starts with MainNavigation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    expect(find.byType(MainNavigation), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Navigation works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    // Initially on Home page
    expect(find.text('Code Editor'), findsOneWidget);
    
    // Tap on Explore
    await tester.tap(find.byIcon(Icons.explore_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Explore'), findsOneWidget);
    
    // Tap on Profile
    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsOneWidget);
  });
}
