import '../../../../core/errors/failures.dart';
import '../repositories/document_repository.dart';

class DeleteDocument {
  final DocumentRepository repository;
  DeleteDocument(this.repository);

  Future<Result<void>> call(int id, String storagePath) {
    return repository.deleteDocument(id, storagePath);
  }
}
