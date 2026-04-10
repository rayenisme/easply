import 'package:easply/domain/entities/document.dart';
import 'package:easply/domain/repositories/document_repository.dart';

class DocumentRepositoryImpl implements DocumentRepository {
  @override
  List<Document> getDocuments() {
    return [
      Document(
        id: "1",
        title: "CV Senior Developer",
        type: "CV",
        createdAt: DateTime.now(),
      ),
      Document(
        id: "2",
        title: "Surat Lamaran Google",
        type: "LETTER",
        createdAt: DateTime.now(),
      ),
    ];
  }
}
