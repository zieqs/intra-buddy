import '../../../../core/errors/failures.dart';
import '../entities/document_item.dart';
import '../repositories/document_repository.dart';

class UploadDocument {
  final DocumentRepository repository;
  UploadDocument(this.repository);

  Future<Result<DocumentItem>> call({
    required String filePath,
    required String itemName,
    String? notes,
  }) {
    return repository.uploadDocument(
      filePath: filePath,
      itemName: itemName,
      notes: notes,
    );
  }
}
