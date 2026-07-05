import '../../../../core/errors/failures.dart';
import '../entities/checklist_item.dart';
import '../repositories/checklist_repository.dart';

class ToggleItem {
  final ChecklistRepository repository;
  ToggleItem(this.repository);

  Future<Result<ChecklistItem>> call(int checklistId, bool completed) {
    return repository.toggleItem(checklistId, completed);
  }
}
