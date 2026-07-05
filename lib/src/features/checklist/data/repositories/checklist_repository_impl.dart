import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/checklist_item.dart';
import '../../domain/repositories/checklist_repository.dart';
import '../datasources/checklist_remote_datasource.dart';
import '../models/checklist_item_model.dart';

class ChecklistRepositoryImpl implements ChecklistRepository {
  final ChecklistRemoteDataSource dataSource;

  ChecklistRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<ChecklistItem>>> loadChecklist() async {
    try {
      final data = await dataSource.loadChecklist();
      final items =
          data.map((json) => ChecklistItemModel.fromJson(json)).toList()
            ..sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
      return Right(items.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<ChecklistItem>> toggleItem(
    int checklistId,
    bool completed,
  ) async {
    try {
      await dataSource.toggleItem(checklistId, completed);
      return Right(
        ChecklistItem(
          id: checklistId,
          checklistItemId: 0,
          title: '',
          isCompleted: completed,
          completedAt: completed ? DateTime.now() : null,
          displayOrder: 0,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
