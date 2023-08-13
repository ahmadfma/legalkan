import 'dart:convert';

MeResponse meResponseFromJson(String str) => MeResponse.fromJson(json.decode(str));

String meResponseToJson(MeResponse data) => json.encode(data.toJson());

class MeResponse {
  User? user;

  MeResponse({
    this.user,
  });

  factory MeResponse.fromJson(Map<String, dynamic> json) => MeResponse(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  String? name;
  dynamic email;
  String? username;
  int? idRole;
  dynamic emailVerifiedAt;
  int? isBcrypt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic updatedBy;
  dynamic admin;
  Mahasiswa? mahasiswa;
  Dosen? dosen;
  Role? role;

  User({
    this.id,
    this.name,
    this.email,
    this.username,
    this.idRole,
    this.emailVerifiedAt,
    this.isBcrypt,
    this.createdAt,
    this.updatedAt,
    this.updatedBy,
    this.admin,
    this.mahasiswa,
    this.dosen,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    username: json["username"],
    idRole: json["id_role"],
    emailVerifiedAt: json["email_verified_at"],
    isBcrypt: json["is_bcrypt"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    updatedBy: json["updated_by"],
    admin: json["admin"],
    mahasiswa: json["mahasiswa"] == null ? null : Mahasiswa.fromJson(json["mahasiswa"]),
    dosen: json["dosen"] == null ? null : Dosen.fromJson(json['dosen']),
    role: json["role"] == null ? null : Role.fromJson(json["role"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "username": username,
    "id_role": idRole,
    "email_verified_at": emailVerifiedAt,
    "is_bcrypt": isBcrypt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "updated_by": updatedBy,
    "admin": admin,
    "mahasiswa": mahasiswa?.toJson(),
    "dosen": dosen,
    "role": role?.toJson(),
  };
}

class Mahasiswa {
  dynamic deletedAt;
  int? id;
  int? idUser;
  int? idProdi;
  int? angkatan;
  String? namaMahasiswa;
  String? nim;
  String? jalan;
  int? rt;
  int? rw;
  String? dusun;
  String? kodePos;
  String? nisn;
  String? tempatLahir;
  DateTime? tanggalLahir;
  String? telepon;
  String? handphone;
  dynamic idAgama;
  int? idProdiJenjang;
  String? kelurahan;
  String? idWilayah;
  String? nik;
  String? jenisKelamin;
  int? isActive;
  int? updatedBy;
  String? kodeStatus;
  String? email;
  int? isTamu;
  Prodi? prodi;

  Mahasiswa({
    this.deletedAt,
    this.id,
    this.idUser,
    this.idProdi,
    this.angkatan,
    this.namaMahasiswa,
    this.nim,
    this.jalan,
    this.rt,
    this.rw,
    this.dusun,
    this.kodePos,
    this.nisn,
    this.tempatLahir,
    this.tanggalLahir,
    this.telepon,
    this.handphone,
    this.idAgama,
    this.idProdiJenjang,
    this.kelurahan,
    this.idWilayah,
    this.nik,
    this.jenisKelamin,
    this.isActive,
    this.updatedBy,
    this.kodeStatus,
    this.email,
    this.isTamu,
    this.prodi,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
    deletedAt: json["deleted_at"],
    id: json["id"],
    idUser: json["id_user"],
    idProdi: json["id_prodi"],
    angkatan: json["angkatan"],
    namaMahasiswa: json["nama_mahasiswa"],
    nim: json["nim"],
    jalan: json["jalan"],
    rt: json["rt"],
    rw: json["rw"],
    dusun: json["dusun"],
    kodePos: json["kode_pos"],
    nisn: json["nisn"],
    tempatLahir: json["tempat_lahir"],
    tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
    telepon: json["telepon"],
    handphone: json["handphone"],
    idAgama: json["id_agama"],
    idProdiJenjang: json["id_prodi_jenjang"],
    kelurahan: json["kelurahan"],
    idWilayah: json["id_wilayah"],
    nik: json["nik"],
    jenisKelamin: json["jenis_kelamin"],
    isActive: json["is_active"],
    updatedBy: json["updated_by"],
    kodeStatus: json["kode_status"],
    email: json["email"],
    isTamu: json["is_tamu"],
    prodi: json["prodi"] == null ? null : Prodi.fromJson(json["prodi"]),
  );

  Map<String, dynamic> toJson() => {
    "deleted_at": deletedAt,
    "id": id,
    "id_user": idUser,
    "id_prodi": idProdi,
    "angkatan": angkatan,
    "nama_mahasiswa": namaMahasiswa,
    "nim": nim,
    "jalan": jalan,
    "rt": rt,
    "rw": rw,
    "dusun": dusun,
    "kode_pos": kodePos,
    "nisn": nisn,
    "tempat_lahir": tempatLahir,
    "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
    "telepon": telepon,
    "handphone": handphone,
    "id_agama": idAgama,
    "id_prodi_jenjang": idProdiJenjang,
    "kelurahan": kelurahan,
    "id_wilayah": idWilayah,
    "nik": nik,
    "jenis_kelamin": jenisKelamin,
    "is_active": isActive,
    "updated_by": updatedBy,
    "kode_status": kodeStatus,
    "email": email,
    "is_tamu": isTamu,
    "prodi": prodi?.toJson(),
  };
}

class Dosen {
  dynamic deletedAt;
  int? id;
  int? idUser;
  int? idProdi;
  String? nama;
  String? nidn;
  String? nip;
  int? isActive;
  dynamic updatedBy;
  Prodi? prodi;

  Dosen({
    this.deletedAt,
    this.id,
    this.idUser,
    this.idProdi,
    this.nama,
    this.nidn,
    this.nip,
    this.isActive,
    this.updatedBy,
    this.prodi,
  });

  factory Dosen.fromJson(Map<String, dynamic> json) => Dosen(
    deletedAt: json["deleted_at"],
    id: json["id"],
    idUser: json["id_user"],
    idProdi: json["id_prodi"],
    nama: json["nama"],
    nidn: json["nidn"],
    nip: json["nip"],
    isActive: json["is_active"],
    updatedBy: json["updated_by"],
    prodi: json["prodi"] == null ? null : Prodi.fromJson(json["prodi"]),
  );

  Map<String, dynamic> toJson() => {
    "deleted_at": deletedAt,
    "id": id,
    "id_user": idUser,
    "id_prodi": idProdi,
    "nama": nama,
    "nidn": nidn,
    "nip": nip,
    "is_active": isActive,
    "updated_by": updatedBy,
    "prodi": prodi?.toJson(),
  };
}

class Prodi {
  int? id;
  String? kodeDikti;
  String? namaResmi;
  String? namaSingkat;
  String? namaAsing;
  dynamic namaAsingSingkat;
  int? isEksakta;
  String? alamat;
  String? nomorTelepon;
  String? fax;
  String? email;
  String? website;
  dynamic updatedAt;
  int? isActive;

  Prodi({
    this.id,
    this.kodeDikti,
    this.namaResmi,
    this.namaSingkat,
    this.namaAsing,
    this.namaAsingSingkat,
    this.isEksakta,
    this.alamat,
    this.nomorTelepon,
    this.fax,
    this.email,
    this.website,
    this.updatedAt,
    this.isActive,
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
  };
}

class Role {
  int? id;
  String? name;

  Role({
    this.id,
    this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
