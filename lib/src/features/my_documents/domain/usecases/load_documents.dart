import '../../../../core/errors/failures.dart';
import '../entities/document_item.dart';
import '../repositories/document_repository.dart';

class LoadDocuments {
  final DocumentRepository repository;
  LoadDocuments(this.repository);

  Future<Result<List<DocumentItem>>> call() => repository.loadDocuments();
}
