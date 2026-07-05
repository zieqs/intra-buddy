import '../../../../core/errors/failures.dart';
import '../entities/checklist_item.dart';
import '../repositories/checklist_repository.dart';

class LoadChecklist {
  final ChecklistRepository repository;
  LoadChecklist(this.repository);

  Future<Result<List<ChecklistItem>>> call() {
    return repository.loadChecklist();
  }
}
