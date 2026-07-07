import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class StepIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const StepIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
  }) : assert(totalSteps > 0, 'totalSteps must be positive'),
       assert(
         currentStep >= 0 && currentStep < totalSteps,
         'currentStep out of range',
       );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalSteps, (index) {
            final isActive = index <= currentStep;
            final isLast = index == totalSteps - 1;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? AppColors.primary : context.outline,
                  ),
                ),
                if (!isLast)
                  SizedBox(
                    width: 40,
                    height: 2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: isActive ? AppColors.primary : context.outline,
                      ),
                    ),
                  ),
              ],
            );
          }),
        ),
        const SizedBox(height: 8),
        Text(
          'Step ${currentStep + 1} of $totalSteps',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: context.muted),
        ),
      ],
    );
  }
}
