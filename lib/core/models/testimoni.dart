import 'dart:convert';

List<Testimoni> testimoniFromJson(String str) => List<Testimoni>.from(json.decode(str).map((x) => Testimoni.fromJson(x)));

String testimoniToJson(List<Testimoni> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Testimoni {
  String? id;
  String? name;
  String? description;
  String? photoUrl;
  String? createdAt;
  String? updatedAt;

  Testimoni({
    this.id,
    this.name,
    this.description,
    this.photoUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Testimoni.fromJson(Map<String, dynamic> json) => Testimoni(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    photoUrl: json["photoUrl"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "photoUrl": photoUrl,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}



final dummyTestimoni = [
  Testimoni(
    id: '646723b025eed92fba51c802',
    name: 'Ahmad Fathanah M.Adil',
    description: 'Setelah mengikuti program bangkit, saya merasa skill saya lebih baik dari sebelumnya',
    photoUrl: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
    createdAt: '2023-05-19T07:22:24.881Z',
    updatedAt: '2023-05-19T07:22:24.881Z'
  ),
  Testimoni(
      id: '646723b025eed92fba51c802',
      name: 'Ahmad Fathanah M.Adil',
      description: 'Setelah mea sda sasd asdas das asd asda sdas dasd asda sdasd ngikuti program bangkit, saya merasa skill saya lebih baik dari sebelumnya',
      photoUrl: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
      createdAt: '2023-05-19T07:22:24.881Z',
      updatedAt: '2023-05-19T07:22:24.881Z'
  ),
  Testimoni(
      id: '646723b025eed92fba51c802',
      name: 'Ahmad Fathanah M.Adil',
      description: 'Setelah mengikuti program bangkit, saya merasa skill saya lebih baik dari sebelumnya',
      photoUrl: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
      createdAt: '2023-05-19T07:22:24.881Z',
      updatedAt: '2023-05-19T07:22:24.881Z'
  ),
  Testimoni(
      id: '646723b025eed92fba51c802',
      name: 'Ahmad Fathanah M.Adil',
      description: 'Setelah mengikuti program bangkit, saya merasa skill saya lebih baik dari sebelumnya',
      photoUrl: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
      createdAt: '2023-05-19T07:22:24.881Z',
      updatedAt: '2023-05-19T07:22:24.881Z'
  )
];