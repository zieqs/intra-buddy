import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class MyDocumentsPlaceholder extends StatelessWidget {
  const MyDocumentsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_outlined, size: 64, color: context.muted),
          const SizedBox(height: 16),
          Text('My Documents', style: Theme.of(context).textTheme.titleLarge),
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
