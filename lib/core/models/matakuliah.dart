import 'dart:convert';

List<Matakuliah> matakuliahFromJson(String str) => List<Matakuliah>.from(json.decode(str).map((x) => Matakuliah.fromJson(x)));

String matakuliahToJson(List<Matakuliah> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Matakuliah {
  int? id;
  String? namaResmi;
  dynamic namaSingkat;
  String? namaAsing;
  dynamic namaAsingSingkat;
  int? idProdi;
  int? idKurikulum;
  int? createdBy;
  dynamic updatedBy;
  int? semester;
  String? sifat;
  int? idProdiJenjang;
  String? kode;
  int? isMataKuliahUmum;
  dynamic idPddikti;
  int? idKelasKuliahJenis;

  Matakuliah({
    this.id,
    this.namaResmi,
    this.namaSingkat,
    this.namaAsing,
    this.namaAsingSingkat,
    this.idProdi,
    this.idKurikulum,
    this.createdBy,
    this.updatedBy,
    this.semester,
    this.sifat,
    this.idProdiJenjang,
    this.kode,
    this.isMataKuliahUmum,
    this.idPddikti,
    this.idKelasKuliahJenis,
  });

  factory Matakuliah.fromJson(Map<String, dynamic> json) => Matakuliah(
    id: json["id"],
    namaResmi: json["nama_resmi"],
    namaSingkat: json["nama_singkat"],
    namaAsing: json["nama_asing"],
    namaAsingSingkat: json["nama_asing_singkat"],
    idProdi: json["id_prodi"],
    idKurikulum: json["id_kurikulum"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    semester: json["semester"],
    sifat: json["sifat"],
    idProdiJenjang: json["id_prodi_jenjang"],
    kode: json["kode"],
    isMataKuliahUmum: json["is_mata_kuliah_umum"],
    idPddikti: json["id_pddikti"],
    idKelasKuliahJenis: json["id_kelas_kuliah_jenis"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_resmi": namaResmi,
    "nama_singkat": namaSingkat,
    "nama_asing": namaAsing,
    "nama_asing_singkat": namaAsingSingkat,
    "id_prodi": idProdi,
    "id_kurikulum": idKurikulum,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "semester": semester,
    "sifat": sifat,
    "id_prodi_jenjang": idProdiJenjang,
    "kode": kode,
    "is_mata_kuliah_umum": isMataKuliahUmum,
    "id_pddikti": idPddikti,
    "id_kelas_kuliah_jenis": idKelasKuliahJenis,
  };
}


final dummyMataKuliah = [
  Matakuliah(
    id: 14,
    namaResmi: 'PENDIDIKAN KEWARGANEGARAAN',
    idKurikulum: 14,
    idProdi: 1415,
    kode: '14141',
    semester: 1,
    sifat: 'B'
  ),
  Matakuliah(
      id: 14,
      namaResmi: 'PENDIDIKAN KEWARGANEGARAAN',
      idKurikulum: 14,
      idProdi: 1415,
      kode: '14141',
      semester: 2,
      sifat: 'B'
  ),
  Matakuliah(
      id: 14,
      namaResmi: 'PENDIDIKAN KEWARGANEGARAAN',
      idKurikulum: 14,
      idProdi: 1415,
      kode: '14141',
      semester: 3,
      sifat: 'B'
  ),
  Matakuliah(
      id: 14,
      namaResmi: 'PENDIDIKAN KEWARGANEGARAAN',
      idKurikulum: 14,
      idProdi: 1415,
      kode: '14141',
      semester: 4,
      sifat: 'B'
  ),
  Matakuliah(
      id: 14,
      namaResmi: 'PENDIDIKAN KEWARGANEGARAAN',
      idKurikulum: 14,
      idProdi: 1415,
      kode: '14141',
      semester: 5,
      sifat: 'B'
  ),
  Matakuliah(
      id: 14,
      namaResmi: 'PENDIDIKAN KEWARGANEGARAAN',
      idKurikulum: 14,
      idProdi: 1415,
      kode: '14141',
      semester: 6,
      sifat: 'B'
  ),
  Matakuliah(
      id: 14,
      namaResmi: 'PENDIDIKAN KEWARGANEGARAAN',
      idKurikulum: 14,
      idProdi: 1415,
      kode: '14141',
      semester: 7,
      sifat: 'B'
  ),
  Matakuliah(
      id: 14,
      namaResmi: 'PENDIDIKAN KEWARGANEGARAAN',
      idKurikulum: 14,
      idProdi: 1415,
      kode: '14141',
      semester: 8,
      sifat: 'B'
  )
];

/*
* {
        "id": 7968,
        "nama_resmi": "PENDIDIKAN KEWARGANEGARAAN",
        "nama_singkat": null,
        "nama_asing": "",
        "nama_asing_singkat": null,
        "id_prodi": 18,
        "id_kurikulum": 115,
        "created_by": 0,
        "updated_by": null,
        "semester": 3,
        "sifat": "B",
        "id_prodi_jenjang": 1,
        "kode": "077U002",
        "is_mata_kuliah_umum": 0,
        "id_pddikti": null,
        "id_kelas_kuliah_jenis": 1
    }*/