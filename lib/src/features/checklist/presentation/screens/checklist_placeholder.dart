import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class ChecklistPlaceholder extends StatelessWidget {
  const ChecklistPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.checklist, size: 64, color: context.muted),
          const SizedBox(height: 16),
          Text('Checklist', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'Coming soon',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: context.muted),
          ),
        ],
      ),
    );
  }
}
