import 'package:injectable/injectable.dart';
import 'package:legalkan/core/api/document_api.dart';
import 'package:legalkan/utils/my_exception.dart';
import '../models/document.dart';
import '../models/response/upload_file_response.dart';

abstract class IDocumentApiRepository {
  Future<List<Document>> getListDocument(String? activityId);
  Future<UploadFileResponse> uploadFile(uploadForm);
  Future<Document> createDocument(documentForm);
  Future<Document> deleteDocument(Document document);
  Future<dynamic> downloadFile(String filename);
}

@LazySingleton(as: IDocumentApiRepository)
class DocumentApiRepository implements IDocumentApiRepository {

  final IDocumentApi _documentApi;

  const DocumentApiRepository(this._documentApi);

  @override
  Future<List<Document>> getListDocument(String? activityId) {
    try {
      return _documentApi.getListDocument(activityId);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<UploadFileResponse> uploadFile(uploadForm) {
    try {
      return _documentApi.uploadFile(uploadForm);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<Document> createDocument(documentForm) {
    try {
      return _documentApi.createDocument(documentForm);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<Document> deleteDocument(Document document) {
    try {
      return _documentApi.deleteDocument(document);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<dynamic> downloadFile(String filename) {
    try {
      return _documentApi.downloadFile(filename);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

}