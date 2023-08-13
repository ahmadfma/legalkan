import 'dart:convert';

List<Document> documentFromJson(String str) => List<Document>.from(json.decode(str).map((x) => Document.fromJson(x)));

String documentToJson(List<Document> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Document {
  String? id;
  String? name;
  int? aksi;
  int? status;
  String? userId;
  String? username;
  String? activityId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fileName;
  String? lampiranName;

  Document({
    this.id,
    this.name,
    this.aksi,
    this.status,
    this.userId,
    this.username,
    this.activityId,
    this.createdAt,
    this.updatedAt,
    this.fileName,
    this.lampiranName,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    id: json["_id"],
    name: json["name"],
    aksi: json["aksi"],
    status: json["status"],
    userId: json["userId"],
    username: json["username"],
    activityId: json["activityId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    fileName: json["fileName"],
    lampiranName: json["lampiranName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "aksi": aksi,
    "status": status,
    "userId": userId,
    "username": username,
    "activityId": activityId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "fileName": fileName,
    "lampiranName": lampiranName,
  };
}

final dummyDocuments = [
  Document(
    id: '6468eb8b4b792a1231fd10e2',
    name: 'Surat Pertanggung Jawaban',
    aksi: 0,
    status: 1,
    userId: 'adasd',
    username: 'asdasd',
    activityId: '6403583498647e657fb96c39',
    fileName: '6468ebb34b792a1231fd10e6',
    lampiranName: '6468ebb34b792a1231fd10e6'
  ),
  Document(
      id: '6468eb8b4b792a1231fd10e2',
      name: 'Surat Pertanggung Jawaban',
      aksi: 0,
      status: 1,
      userId: 'adasd',
      username: 'asdasd',
      activityId: '6403583498647e657fb96c39',
      fileName: '6468ebb34b792a1231fd10e6',
      lampiranName: '6468ebb34b792a1231fd10e6'
  ),
  Document(
      id: '6468eb8b4b792a1231fd10e2',
      name: 'Surat Pertanggung Jawaban',
      aksi: 0,
      status: 1,
      userId: 'adasd',
      username: 'asdasd',
      activityId: '6403583498647e657fb96c39',
      fileName: '6468ebb34b792a1231fd10e6',
      lampiranName: '6468ebb34b792a1231fd10e6'
  ),
];