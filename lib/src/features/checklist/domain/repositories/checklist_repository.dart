import '../../../../core/errors/failures.dart';
import '../entities/checklist_item.dart';

abstract class ChecklistRepository {
  Future<Result<List<ChecklistItem>>> loadChecklist();
  Future<Result<ChecklistItem>> toggleItem(int checklistId, bool completed);
}
