import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class ChatComposer extends StatelessWidget {
  final TextEditingController controller;
  final bool isProcessing;
  final VoidCallback? onSend;
  final VoidCallback? onStop;

  const ChatComposer({
    super.key,
    required this.controller,
    this.isProcessing = false,
    this.onSend,
    this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: context.background),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: context.surface,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: context.outline),
                ),
                child: TextField(
                  controller: controller,
                  enabled: !isProcessing,
                  decoration: InputDecoration(
                    hintText: 'Ask about INTRA...',
                    hintStyle: TextStyle(
                      color: context.muted,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),
                  ),
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) {
                    if (!isProcessing) onSend?.call();
                  },
                  style: TextStyle(
                    color: context.onSurface,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: isProcessing ? onStop : onSend,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isProcessing
                      ? AppColors.error
                      : (controller.text.trim().isEmpty
                            ? context.surface
                            : AppColors.primary),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isProcessing ? Icons.stop : Icons.arrow_upward,
                  color: isProcessing
                      ? AppColors.onError
                      : (controller.text.trim().isEmpty
                            ? context.muted
                            : AppColors.onPrimary),
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
