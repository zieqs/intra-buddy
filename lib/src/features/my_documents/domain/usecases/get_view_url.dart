import '../../../../core/errors/failures.dart';
import '../repositories/document_repository.dart';

class GetViewUrl {
  final DocumentRepository repository;
  GetViewUrl(this.repository);

  Future<Result<String>> call(String storagePath) {
    return repository.getViewUrl(storagePath);
  }
}
