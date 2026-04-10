import 'package:easply/domain/entities/document.dart';

abstract class DocumentRepository {
  List<Document> getDocuments();
}
