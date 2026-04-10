import 'package:easply/domain/entities/document.dart';
import 'package:easply/domain/usecases/get_documents_usecase.dart';

class DocumentController {
  final GetDocumentsUseCase useCase;

  DocumentController(this.useCase);

  List<Document> getDocuments() {
    return useCase.execute();
  }
}
