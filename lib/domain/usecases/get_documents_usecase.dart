import 'package:easply/domain/entities/document.dart';
import 'package:easply/domain/repositories/document_repository.dart';

class GetDocumentsUseCase {
  final DocumentRepository repository;

  GetDocumentsUseCase(this.repository);

  List<Document> execute() {
    return repository.getDocuments();
  }
}
