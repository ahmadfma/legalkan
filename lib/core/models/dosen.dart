import 'dart:convert';

List<Dosen> dosenFromJson(String str) => List<Dosen>.from(json.decode(str).map((x) => Dosen.fromJson(x)));

String dosenToJson(List<Dosen> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dosen {
  String? id;
  String? name;
  String? nip;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  Dosen({
    this.id,
    this.name,
    this.nip,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Dosen.fromJson(Map<String, dynamic> json) => Dosen(
    id: json["_id"],
    name: json["name"],
    nip: json["nip"],
    imageUrl: json["imageUrl"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "nip": nip,
    "imageUrl": imageUrl,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
