// To parse this JSON data, do
//
//     final matakuliahDosen = matakuliahDosenFromJson(jsonString);

import 'dart:convert';

List<MatakuliahDosen> matakuliahDosenFromJson(String str) => List<MatakuliahDosen>.from(json.decode(str).map((x) => MatakuliahDosen.fromJson(x)));

String matakuliahDosenToJson(List<MatakuliahDosen> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MatakuliahDosen {
  int id;
  int idProdiSemester;
  int idMataKuliah;
  String nama;
  int maxParticipant;
  int idKelasKuliahJenis;
  dynamic idKelasKuliahJenisSubKelas;
  dynamic idParent;
  int isBlok;
  int isAntaraSemester;
  String namaPddikti;
  int isBatal;
  int idJenisPertemuan;
  dynamic idKelasPddikti;
  dynamic clonedFrom;
  dynamic syncFeederAt;
  MataKuliah mataKuliah;
  ProdiSemester prodiSemester;

  MatakuliahDosen({
    required this.id,
    required this.idProdiSemester,
    required this.idMataKuliah,
    required this.nama,
    required this.maxParticipant,
    required this.idKelasKuliahJenis,
    this.idKelasKuliahJenisSubKelas,
    this.idParent,
    required this.isBlok,
    required this.isAntaraSemester,
    required this.namaPddikti,
    required this.isBatal,
    required this.idJenisPertemuan,
    this.idKelasPddikti,
    this.clonedFrom,
    this.syncFeederAt,
    required this.mataKuliah,
    required this.prodiSemester,
  });

  factory MatakuliahDosen.fromJson(Map<String, dynamic> json) => MatakuliahDosen(
    id: json["id"],
    idProdiSemester: json["id_prodi_semester"],
    idMataKuliah: json["id_mata_kuliah"],
    nama: json["nama"],
    maxParticipant: json["max_participant"],
    idKelasKuliahJenis: json["id_kelas_kuliah_jenis"],
    idKelasKuliahJenisSubKelas: json["id_kelas_kuliah_jenis_sub_kelas"],
    idParent: json["id_parent"],
    isBlok: json["is_blok"],
    isAntaraSemester: json["is_antara_semester"],
    namaPddikti: json["nama_pddikti"],
    isBatal: json["is_batal"],
    idJenisPertemuan: json["id_jenis_pertemuan"],
    idKelasPddikti: json["id_kelas_pddikti"],
    clonedFrom: json["cloned_from"],
    syncFeederAt: json["sync_feeder_at"],
    mataKuliah: MataKuliah.fromJson(json["mata_kuliah"]),
    prodiSemester: ProdiSemester.fromJson(json["prodi_semester"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_prodi_semester": idProdiSemester,
    "id_mata_kuliah": idMataKuliah,
    "nama": nama,
    "max_participant": maxParticipant,
    "id_kelas_kuliah_jenis": idKelasKuliahJenis,
    "id_kelas_kuliah_jenis_sub_kelas": idKelasKuliahJenisSubKelas,
    "id_parent": idParent,
    "is_blok": isBlok,
    "is_antara_semester": isAntaraSemester,
    "nama_pddikti": namaPddikti,
    "is_batal": isBatal,
    "id_jenis_pertemuan": idJenisPertemuan,
    "id_kelas_pddikti": idKelasPddikti,
    "cloned_from": clonedFrom,
    "sync_feeder_at": syncFeederAt,
    "mata_kuliah": mataKuliah.toJson(),
    "prodi_semester": prodiSemester.toJson(),
  };
}

class MataKuliah {
  int id;
  String namaResmi;
  dynamic namaSingkat;
  String namaAsing;
  dynamic namaAsingSingkat;
  int idProdi;
  int idKurikulum;
  int createdBy;
  String? updatedBy;
  int semester;
  String sifat;
  int idProdiJenjang;
  String kode;
  int isMataKuliahUmum;
  dynamic idPddikti;
  int idKelasKuliahJenis;
  int isKemajuanStudi;
  List<MataKuliahJumlahSkse> mataKuliahJumlahSkses;
  MataKuliahSifat mataKuliahSifat;

  MataKuliah({
    required this.id,
    required this.namaResmi,
    this.namaSingkat,
    required this.namaAsing,
    this.namaAsingSingkat,
    required this.idProdi,
    required this.idKurikulum,
    required this.createdBy,
    this.updatedBy,
    required this.semester,
    required this.sifat,
    required this.idProdiJenjang,
    required this.kode,
    required this.isMataKuliahUmum,
    this.idPddikti,
    required this.idKelasKuliahJenis,
    required this.isKemajuanStudi,
    required this.mataKuliahJumlahSkses,
    required this.mataKuliahSifat,
  });

  factory MataKuliah.fromJson(Map<String, dynamic> json) => MataKuliah(
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
    isKemajuanStudi: json["is_kemajuan_studi"],
    mataKuliahJumlahSkses: List<MataKuliahJumlahSkse>.from(json["mata_kuliah_jumlah_skses"].map((x) => MataKuliahJumlahSkse.fromJson(x))),
    mataKuliahSifat: MataKuliahSifat.fromJson(json["mata_kuliah_sifat"]),
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
    "is_kemajuan_studi": isKemajuanStudi,
    "mata_kuliah_jumlah_skses": List<dynamic>.from(mataKuliahJumlahSkses.map((x) => x.toJson())),
    "mata_kuliah_sifat": mataKuliahSifat.toJson(),
  };
}

class MataKuliahJumlahSkse {
  int id;
  int idMataKuliah;
  int idTipeSks;
  int jumlahSks;
  TipeSks tipeSks;

  MataKuliahJumlahSkse({
    required this.id,
    required this.idMataKuliah,
    required this.idTipeSks,
    required this.jumlahSks,
    required this.tipeSks,
  });

  factory MataKuliahJumlahSkse.fromJson(Map<String, dynamic> json) => MataKuliahJumlahSkse(
    id: json["id"],
    idMataKuliah: json["id_mata_kuliah"],
    idTipeSks: json["id_tipe_sks"],
    jumlahSks: json["jumlah_sks"],
    tipeSks: TipeSks.fromJson(json["tipe_sks"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_mata_kuliah": idMataKuliah,
    "id_tipe_sks": idTipeSks,
    "jumlah_sks": jumlahSks,
    "tipe_sks": tipeSks.toJson(),
  };
}

class TipeSks {
  int id;
  String nama;
  String singkatan;
  dynamic createdAt;
  dynamic updatedAt;

  TipeSks({
    required this.id,
    required this.nama,
    required this.singkatan,
    this.createdAt,
    this.updatedAt,
  });

  factory TipeSks.fromJson(Map<String, dynamic> json) => TipeSks(
    id: json["id"],
    nama: json["nama"],
    singkatan: json["singkatan"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "singkatan": singkatan,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class MataKuliahSifat {
  int id;
  String kode;
  String singkatan;
  String nama;

  MataKuliahSifat({
    required this.id,
    required this.kode,
    required this.singkatan,
    required this.nama,
  });

  factory MataKuliahSifat.fromJson(Map<String, dynamic> json) => MataKuliahSifat(
    id: json["id"],
    kode: json["kode"],
    singkatan: json["singkatan"],
    nama: json["nama"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode": kode,
    "singkatan": singkatan,
    "nama": nama,
  };
}

class ProdiSemester {
  int id;
  int idSemester;
  int idProdi;
  String createdAt;
  String updatedAt;
  int createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  int isActive;
  int isUsed;
  Prodi prodi;

  ProdiSemester({
    required this.id,
    required this.idSemester,
    required this.idProdi,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
    this.deletedAt,
    required this.isActive,
    required this.isUsed,
    required this.prodi,
  });

  factory ProdiSemester.fromJson(Map<String, dynamic> json) => ProdiSemester(
    id: json["id"],
    idSemester: json["id_semester"],
    idProdi: json["id_prodi"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    deletedAt: json["deleted_at"],
    isActive: json["is_active"],
    isUsed: json["is_used"],
    prodi: Prodi.fromJson(json["prodi"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_semester": idSemester,
    "id_prodi": idProdi,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "deleted_at": deletedAt,
    "is_active": isActive,
    "is_used": isUsed,
    "prodi": prodi.toJson(),
  };
}

class Prodi {
  int id;
  String kodeDikti;
  String namaResmi;
  String namaSingkat;
  String namaAsing;
  dynamic namaAsingSingkat;
  int isEksakta;
  String alamat;
  String nomorTelepon;
  String fax;
  String email;
  String website;
  String updatedAt;
  int isActive;
  String idPddikti;

  Prodi({
    required this.id,
    required this.kodeDikti,
    required this.namaResmi,
    required this.namaSingkat,
    required this.namaAsing,
    this.namaAsingSingkat,
    required this.isEksakta,
    required this.alamat,
    required this.nomorTelepon,
    required this.fax,
    required this.email,
    required this.website,
    required this.updatedAt,
    required this.isActive,
    required this.idPddikti,
  });

  factory Prodi.fromJson(Map<String, dynamic> json) => Prodi(
    id: json["id"],
    kodeDikti: json["kode_dikti"],
    namaResmi: json["nama_resmi"],
    namaSingkat: json["nama_singkat"],
    namaAsing: json["nama_asing"],
    namaAsingSingkat: json["nama_asing_singkat"],
    isEksakta: json["is_eksakta"],
    alamat: json["alamat"],
    nomorTelepon: json["nomor_telepon"],
    fax: json["fax"],
    email: json["email"],
    website: json["website"],
    updatedAt: json["updated_at"],
    isActive: json["is_active"],
    idPddikti: json["id_pddikti"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode_dikti": kodeDikti,
    "nama_resmi": namaResmi,
    "nama_singkat": namaSingkat,
    "nama_asing": namaAsing,
    "nama_asing_singkat": namaAsingSingkat,
    "is_eksakta": isEksakta,
    "alamat": alamat,
    "nomor_telepon": nomorTelepon,
    "fax": fax,
    "email": email,
    "website": website,
    "updated_at": updatedAt,
    "is_active": isActive,
    "id_pddikti": idPddikti,
  };
}
