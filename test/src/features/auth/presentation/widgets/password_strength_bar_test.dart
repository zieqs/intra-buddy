import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intra_buddy_mobile_v2/src/features/auth/presentation/widgets/password_strength_bar.dart';

void main() {
  group('PasswordStrengthBar', () {
    testWidgets('shows nothing for empty password', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: PasswordStrengthBar(password: '')),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('shows weak for 6 chars', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: PasswordStrengthBar(password: 'abcdef')),
        ),
      );

      expect(find.text('Weak'), findsOneWidget);
    });

    testWidgets('shows medium for 8 chars', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: PasswordStrengthBar(password: 'abcdefgh')),
        ),
      );

      expect(find.text('Medium'), findsOneWidget);
    });

    testWidgets('shows strong for 12 chars', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: PasswordStrengthBar(password: 'abcdefghijkl')),
        ),
      );

      expect(find.text('Strong'), findsOneWidget);
    });

    testWidgets('shows nothing for 5 chars (short)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: PasswordStrengthBar(password: 'abcde')),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('shows medium at 7 chars (boundary)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: PasswordStrengthBar(password: 'abcdefg')),
        ),
      );

      expect(find.text('Medium'), findsOneWidget);
    });

    testWidgets('shows strong at 10 chars (boundary)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: PasswordStrengthBar(password: 'abcdefghij')),
        ),
      );

      expect(find.text('Strong'), findsOneWidget);
    });
  });
}
