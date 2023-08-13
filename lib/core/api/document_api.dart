import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:legalkan/core/models/document.dart';
import 'package:legalkan/utils/file_helper.dart';
import 'package:legalkan/utils/my_exception.dart';
import '../models/response/upload_file_response.dart';

abstract class IDocumentApi {
  Future<List<Document>> getListDocument(String? activityId);
  Future<UploadFileResponse> uploadFile(uploadForm);
  Future<Document> createDocument(documentForm);
  Future<Document> deleteDocument(Document document);
  Future<dynamic> downloadFile(String filename);
}

@LazySingleton(as: IDocumentApi)
class DocumentApi implements IDocumentApi {

  final Dio _dio;
  
  DocumentApi(this._dio);
  
  @override
  Future<List<Document>> getListDocument(String? activityId) async {
    try {
      final response = await _dio.get(
        '/myDocuments',
        queryParameters: activityId != null
          ? { "activityId": activityId }
          : null
      );
      if(response.statusCode == 200) {
        return documentFromJson(jsonEncode(response.data));
      } else {
        throw const MyException('Terjadi kesalahan saat memuat daftar dokumen');
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<UploadFileResponse> uploadFile(uploadForm) async {
    try {
      final response = await _dio.post(
          '/file',
          data: uploadForm
      );
      if(response.statusCode == 200) {
        return uploadFileResponseFromJson(jsonEncode(response.data));
      } else {
        throw const MyException("Terjadi kesalahan saat mengupload file");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<Document> createDocument(documentForm) async {
    try {
      final response = await _dio.post(
        '/document',
        data: documentForm
      );
      if(response.statusCode == 200) {
        return Document.fromJson(response.data);
      } else {
        throw const MyException("Terjadi kesalahan saat membuat dokumen");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<Document> deleteDocument(Document document) async {
    try {
      final response = await _dio.delete(
        '/document',
        data: {
          'documentId': document.id
        }
      );
      if(response.statusCode == 200) {
        return Document.fromJson(response.data);
      } else {
        throw const MyException("Terjadi kesalahan saat menghapus dokumen");
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

  @override
  Future<dynamic> downloadFile(String filename) async {
    try {
      await Permission.storage.request();
      final downloadDir = await findLocalDirectoryPath();
      final response = await _dio.download('/file/preview/$filename', '$downloadDir/$filename');
      if(response.statusCode == 200) {
        return response.data;
      } else {
        throw MyException(response.statusMessage.toString());
      }
    } on DioError catch(e) {
      throw MyException(e.response?.data['error']);
    }
  }

}