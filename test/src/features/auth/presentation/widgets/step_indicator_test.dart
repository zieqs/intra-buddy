import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intra_buddy_mobile_v2/src/features/auth/presentation/widgets/step_indicator.dart';

void main() {
  group('StepIndicator', () {
    testWidgets('renders correct number of dots', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StepIndicator(totalSteps: 3, currentStep: 0),
          ),
        ),
      );

      expect(find.byType(Container), findsNWidgets(3));
    });

    testWidgets('highlights active step', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StepIndicator(totalSteps: 3, currentStep: 1),
          ),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container)).toList();
      // Second dot (index 1) should be filled/active
      expect(containers[1].decoration, isA<BoxDecoration>());
    });

    testWidgets('shows step label', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StepIndicator(totalSteps: 2, currentStep: 0),
          ),
        ),
      );

      expect(find.text('Step 1 of 2'), findsOneWidget);
    });

    testWidgets('highlights last step when active', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StepIndicator(totalSteps: 3, currentStep: 2),
          ),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container)).toList();
      // Last dot should also have a BoxDecoration (active)
      expect(containers[2].decoration, isA<BoxDecoration>());
    });

    testWidgets('renders single step', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StepIndicator(totalSteps: 1, currentStep: 0),
          ),
        ),
      );

      expect(find.text('Step 1 of 1'), findsOneWidget);
    });
  });
}
