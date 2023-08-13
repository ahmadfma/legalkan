import 'dart:convert';
import 'package:legalkan/core/models/document.dart';

UploadFileResponse uploadFileResponseFromJson(String str) => UploadFileResponse.fromJson(json.decode(str));

String uploadFileResponseToJson(UploadFileResponse data) => json.encode(data.toJson());

class UploadFileResponse {
  String? message;
  Document? dokumen;

  UploadFileResponse({
    this.message,
    this.dokumen,
  });

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) => UploadFileResponse(
    message: json["message"],
    dokumen: json["dokumen"] == null ? null : Document.fromJson(json["dokumen"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "dokumen": dokumen?.toJson(),
  };
}