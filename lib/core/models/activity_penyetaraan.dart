import 'dart:convert';

ActivityPenyetaraan activityPenyetaraanFromJson(String str) => ActivityPenyetaraan.fromJson(json.decode(str));

String activityPenyetaraanToJson(ActivityPenyetaraan data) => json.encode(data.toJson());

class ActivityPenyetaraan {
  String? id;
  String? activityId;
  int? jumlahSks;
  int? jumlahMataKuliah;
  List<String>? mataKuliah;
  int? status;

  ActivityPenyetaraan({
    this.id,
    this.activityId,
    this.jumlahSks,
    this.jumlahMataKuliah,
    this.mataKuliah,
    this.status,
  });

  factory ActivityPenyetaraan.fromJson(Map<String, dynamic> json) => ActivityPenyetaraan(
    id: json["_id"],
    activityId: json["activityId"],
    jumlahSks: json["jumlahSks"],
    jumlahMataKuliah: json["jumlahMataKuliah"],
    mataKuliah: json["mataKuliah"] == null ? [] : List<String>.from(json["mataKuliah"]!.map((x) => x)),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "activityId": activityId,
    "jumlahSks": jumlahSks,
    "jumlahMataKuliah": jumlahMataKuliah,
    "mataKuliah": mataKuliah == null ? [] : List<dynamic>.from(mataKuliah!.map((x) => x)),
    "status": status,
  };
}