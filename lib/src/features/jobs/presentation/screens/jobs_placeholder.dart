import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class JobsPlaceholder extends StatelessWidget {
  const JobsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.work_outlined, size: 64, color: AppColors.muted),
          const SizedBox(height: 16),
          Text(
            'Job Applications',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Coming soon',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}
