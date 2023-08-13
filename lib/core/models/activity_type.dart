import 'dart:convert';

List<ActivityType> activityTypeFromJson(String str) => List<ActivityType>.from(json.decode(str).map((x) => ActivityType.fromJson(x)));

String activityTypeToJson(List<ActivityType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityType {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? sourceLink;
  int? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  ActivityType({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.sourceLink,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory ActivityType.fromJson(Map<String, dynamic> json) => ActivityType(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    sourceLink: json["sourceLink"],
    type: json["type"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "imageUrl": imageUrl,
    "sourceLink": sourceLink,
    "type": type,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}


final dummyActivityTypes = [
  ActivityType(
    id: '63fb38686d56aa6be088109e',
    name: 'Kampus Mengajar',
    description: 'Bantu tingkatkan kualitas pengajaran pendidikan dasar melalui Kampus Mengajar',
    imageUrl: 'https://www.unja.ac.id/wp-content/uploads/2023/02/logo-kampus-mengajar-3_kampus-mengajar-PNG-1200x367-1.png',
    sourceLink: 'https://kampusmerdeka.kemdikbud.go.id/program/mengajar',
    type: 0
  ),
  ActivityType(
      id: '63fb38686d56aa6be088109e',
      name: 'Pertukaran Mahasiswa',
      description: 'Bantu tingkatkan kualitas pengajaran pendidikan dasar melalui Kampus Mengajar',
      imageUrl: 'https://theme.zdassets.com/theme_assets/11435355/c76f917849c927845f9d4da1b07da14aa1e39ef1.png',
      sourceLink: 'https://kampusmerdeka.kemdikbud.go.id/program/mengajar',
      type: 1
  ),
  ActivityType(
      id: '63fb38686d56aa6be088109e',
      name: 'Kampus Mengajar',
      description: 'Bantu tingkatkan kualitas pengajaran pendidikan dasar melalui Kampus Mengajar',
      imageUrl: 'https://www.unja.ac.id/wp-content/uploads/2023/02/logo-kampus-mengajar-3_kampus-mengajar-PNG-1200x367-1.png',
      sourceLink: 'https://kampusmerdeka.kemdikbud.go.id/program/mengajar',
      type: 2
  ),
  ActivityType(
      id: '63fb38686d56aa6be088109e',
      name: 'Kampus Mengajar',
      description: 'Bantu tingkatkan kualitas pengajaran pendidikan dasar melalui Kampus Mengajar',
      imageUrl: 'https://www.unja.ac.id/wp-content/uploads/2023/02/logo-kampus-mengajar-3_kampus-mengajar-PNG-1200x367-1.png',
      sourceLink: 'https://kampusmerdeka.kemdikbud.go.id/program/mengajar',
      type: 3
  ),
  ActivityType(
      id: '63fb38686d56aa6be088109e',
      name: 'Kampus Mengajar',
      description: 'Bantu tingkatkan kualitas pengajaran pendidikan dasar melalui Kampus Mengajar',
      imageUrl: 'https://www.unja.ac.id/wp-content/uploads/2023/02/logo-kampus-mengajar-3_kampus-mengajar-PNG-1200x367-1.png',
      sourceLink: 'https://kampusmerdeka.kemdikbud.go.id/program/mengajar',
      type: 4
  ),
  ActivityType(
      id: '63fb38686d56aa6be088109e',
      name: 'Kampus Mengajar',
      description: 'Bantu tingkatkan kualitas pengajaran pendidikan dasar melalui Kampus Mengajar',
      imageUrl: 'https://www.unja.ac.id/wp-content/uploads/2023/02/logo-kampus-mengajar-3_kampus-mengajar-PNG-1200x367-1.png',
      sourceLink: 'https://kampusmerdeka.kemdikbud.go.id/program/mengajar',
      type: 5
  ),
];