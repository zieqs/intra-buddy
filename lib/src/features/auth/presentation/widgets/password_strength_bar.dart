import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class PasswordStrengthBar extends StatelessWidget {
  final String password;

  const PasswordStrengthBar({super.key, required this.password});

  int get _strength {
    if (password.isEmpty) return 0;
    if (password.length < 6) return 0;
    if (password.length <= 6) return 1;
    if (password.length <= 9) return 2;
    return 3;
  }

  String get _label {
    switch (_strength) {
      case 1:
        return 'Weak';
      case 2:
        return 'Medium';
      case 3:
        return 'Strong';
      default:
        return '';
    }
  }

  Color _color(int segment) {
    if (segment > _strength) return Colors.transparent;
    switch (_strength) {
      case 1:
        return AppColors.error;
      case 2:
        return AppColors.tertiary;
      case 3:
        return AppColors.secondary;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (password.length < 6) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: List.generate(3, (index) {
              return Expanded(
                child: Container(
                  height: 4,
                  margin: EdgeInsets.only(right: index < 2 ? 4 : 0),
                  decoration: BoxDecoration(
                    color: _color(index + 1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            }),
          ),
          if (_strength > 0)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                _label,
                style: TextStyle(fontSize: 12, color: _color(1)),
              ),
            ),
        ],
      ),
    );
  }
}
